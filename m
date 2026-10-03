Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBB739A4CF
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791067042; cv=none; b=oRfGfrBWAfeG05c6drq848LXJwNkFw33A50Hm5CIiDoilWdVL4vNRqgPJ6fVe5fH1OCf0nnOimW77MDlAqkW/ay1GSmWHLcpT9mk1hue9uQeTlDiaw+anrAdDUOVCvDLLoLqGb38TQMbzuQt7J0MC93DMDC78KR+HNsXebPT+cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791067042; c=relaxed/simple;
	bh=kz9Gv08Ifi67EI1jeifT4K+itNfN1SXPlehL2hJ15qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOH/6R3F9NuEU2skPMYmm4vLxSFvmvpRllEZttUwOGKT91HWn6mSvu1rqavyFJNb4D4CzwzFl4od3aUBE7QlmcHDL/dDOAkwwshjkmnjALo2aJLShMJFoUTf5baUgedFqQ4UfW9/bjjwtZ91tn2fET1XDKuq6mpfANOFZWIeYY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzYGMJqY; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzYGMJqY"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-148bc4a87eeso31507c88.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791067040; x=1791671840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kz9Gv08Ifi67EI1jeifT4K+itNfN1SXPlehL2hJ15qc=;
        b=mzYGMJqYcmhDURPdRu67LBEZ+o1PfXPH4pe1/jxtzAuCR6d9HhiPdJw9H138nYYOqt
         ccp4KsbuOPug02leV3wC9moW0ffXBzfIKDRhTBQ2C+tVmBrrUp2UDrtbL05in+458glc
         HSTbvsCUKByBuqhOvunudS0z/3TtLV0lNxNNlWztd5lgsc7/dzGt8kw3R8OZSGYVH5dA
         Zy5LQNhpd7jhDclG2z4tzdPHDTJOFOGRqdphdtFk/GLUdkxDMTmcqyx/QeiDOPPHzYot
         p25t2E3aw5WyjV6TPEsRAoyH5fYtjVmmMoNHlpRpri6/2AK6lqgZL7yGwccqc3IzFNlz
         16Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791067040; x=1791671840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kz9Gv08Ifi67EI1jeifT4K+itNfN1SXPlehL2hJ15qc=;
        b=qEQDg8R6mJ75LNBcHOC8vNAfANBhScXfHn8eElUjWaNjgsEJdYuBJI8aDMkZt6K3Bj
         G9PFdGO57VbAFkJ0knJUw2X5y729J9L7sDRihesh4cdcGZSv/AGuE3uSxKWJTKojNh4d
         CrGQWyGW0qSF9dBCaBeBz1j6WJmNfBCrEke0TWmlmIq84yy3uDWO6S7O7k+FHGM89Wlx
         jPzBmQWWfyJyK7+AQHxJp31/DsP6u+Dev5GBFJAQQADi3/2NWTNWbWfcySQvUeny8adr
         I86+GQ2oQ4H02T/PXn31NluPd5GcwmnpEYWvfLkKTW95B3q3aUssk4PH7mgTE4iUQiKr
         EKwA==
X-Forwarded-Encrypted: i=1; AKwUvBw58rOZO+ap2yJr64irkbNK8+o25pVQfvNtrpSD/bLyBrJTq7d+cGPzWkYaNUJPKHEFqkfchRx8o5rCKeI=@vger.kernel.org
X-Gm-Message-State: AFuF++nXtlRKHQAd8dusZ7iLh97xAHNIBXPqvIrrGVXxaUhjAb+EDLAX
	uANkcxrxMHa8JZ/h/CUzTCHuInwCtXQI9aQRhlQwwrSjSqinHHlkoVLQ
X-Gm-Gg: AYBFou3huA10VsYbO/sayzAB95yVviByuzufs83BaLldHeQLfuGAaAThaiA+1Oz8Gyb
	m4NVhldNcM60JaEyX4T2ZPaj0TVxPCj44UhMLZN4JCsMdDOZhQHNRzkcP2QIQewsHXziI7Ywlwb
	ZKNz5hBtVPShOOnrz85edxKCPAo5+baTLMVky3bTd8BB/3jHOjE+HtCvIz257AULOslOVy5TMq5
	qhbL0mrWDkQyaeb+iNcQhNSze2ZL2WSOaVB4SaDqjLCQDFFOxTlDkM5yDOA5mxsTCdNVgHlB05X
	RoPQodELAZMnB2R5anZ6oGJzndagx+Zrzli75nlkovFnHA97kePDtAyQ6Fl/Ea5Id9uR9fwVy9S
	kQaXrqzkTxEN/RKZahXMFa4o+L82E+y2khJVd5TVTZkM+iFVQU8EmpmB6CZZX/dxx6jbytsbaF9
	yCjXSrX+v5ibU9UyCIISJlivT58elG2xKCRtZM0ZFf6jiidQBDMfpOV8orpy2NNOPE5wWvovCEH
	dtKyJE8C8S5HnfhEG/6p5J+u1xPRyARiOlA44xGjn62HuEq2YG2ZmLuSzzJm6Q9wCW/32uRY5e7
	XGgFYkIFUhq+W1oqZA==
X-Received: by 2002:a05:701b:2516:b0:144:ff51:2d73 with SMTP id a92af1059eb24-14f5b11e751mr11364239c88.2.1791067040090;
        Sat, 03 Oct 2026 15:37:20 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa751693sm21283370c88.2.2026.10.03.15.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:37:19 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: miriam.rachel.korenblit@intel.com,
	linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	helgaas@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	emmanuel.grumbach@intel.com,
	nika@nikableh.moe,
	mpearson-lenovo@squebb.ca,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless v3 0/4] wifi: iwlwifi: recover the BE200 after D3cold removes its power
Date: Sun,  4 Oct 2026 04:07:12 +0530
Message-ID: <20261003223712.14003-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1789333511.git.navonjohnlukose@gmail.com>
References: <cover.1789333511.git.navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miri,

Ping on this series. It is still needed on 7.2.8: when _PR3 removes
the card's rail in s2idle, BE200 (and others) comes back reading all
ones and Wi-Fi stays down until reboot.
