Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588506;
	b=Z8akLanZecnMq/8fUwgBMoh5OvGxED4nh6LyTGdffVbsXRWzYGFL46QOb3S4YnRSZvb8
	 yjrpjfvEWkhDtO1xMymT1uPGdjE8oaA6PwdvUbtvCSg41d/F/rumw9l14ukGDwIoPtws5
	 aLJ6oBn5l9/ItnRCT4pXwjRY7/Ke5jP6mE7Zu/UYN60zcRI6PC/b97x1VS2VCRsKVTmL7
	 MEPSukO+Ua6iMkANcj92jt0gH9bf28mhbDYvinaA5VP2dDuiplWQQw2D0ADNMqf0K64F6
	 mdylBjVVrAhLyeOsHxe3aJUNHJNy5vZM4q8l8YkdDXwyx3DmItD+o9NpQvRVbW7H9+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MqUHtb91EGdlurTZlXxP4P7Tr3AqGBBA+lpnZnmX+hs=;
	b=e2tM9XyO2MR5X60gwRdD5Rf/jG3bjm0Ey/c1Dfy6ma8qT310VdGk8OTQtvI1mmgrWseV
	 5Mkybwm65W7RkNh86gaSRNxoELUfWvHiEquwVgnU00I4VeBe1KaqTJw8ikDu73KhSmW2z
	 vyPBIxDtA5EWRfoATgL6t8fZuJjsqEsdptbfBlsvjprZ+fqD81PKY0Qyhv8eKp3kGIn6F
	 DM1KjVYxviVO/XPkKsBxAGe9PLvsQEJ5rbHbw+Y4oytc931eMZxQg9SdwaJWUGE3dfynW
	 KWOZryn97/Wml7PxAiko6ra9cahwrhwoBwlrEr+MxTk1kWoddJC5FMdiT7200kn/kHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ZoiAG+th;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438B4606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 438B4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ZoiAG+th
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-868b3248b2cso431599b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792588504; x=1793193304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqUHtb91EGdlurTZlXxP4P7Tr3AqGBBA+lpnZnmX+hs=;
        b=ZoiAG+thjNuSCBxrm+Ztvoo5TwArUAkM5ICO1111dsWB6kgWplFSTMFHvjWPiH+drZ
         IzkFF3YDNMxyRvao4luVZQLYqX3Q6/QVdaBtFr5dl2jSFKi3qvk0XQ6eKmjB71lpbZvh
         4Y5OSh4lIywV0y4Nrh8pvDSWGJikYk2zNcdUtMIigFXOW5V0lbSTHsjZB4v7ILyFyHMw
         T+YHxyXT/7f8V6j8HHAP2RCCq43wMZAYvDu85hIFM8NvC5ESIyX1+2cyQ5c+4lrzDb5F
         oAgn79hiRhvyec3FjwE5HAlHhgCy3Te4pPNWtdQK2BBlWq2xHCakOg3k83kUln14Xk2Y
         9Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588504; x=1793193304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqUHtb91EGdlurTZlXxP4P7Tr3AqGBBA+lpnZnmX+hs=;
        b=Pr/W0whkhI0YfnSeXZgPmo1QVyclqUntb+HitHd4f7L7J1V0xgNN0H8+QEXYXS53p/
         wm/u0IeGj7vzOowNV+bZiIz9ru6w+aWZB6N/fgX17uAHY7w4ZhCfvNRXlrwwGOAjg1Eo
         ymkF2V5p0r9iYTeWMHNPPEwHeq4Mkvfwf5/2kmPu3GGXIDCANtQshJqmVIcnJy/TXmUP
         k/EPUWIsNDhUOL7Wa13d9tLoKOoRLSEJPoEhDfYN+bZGNeuq2FJ8kYA2QlX92XbNPFm9
         WZuI8faaJy1vi2ZiPpnIi7KPuq63eilRBYawXyEVviLcvKaE1ZniBL/ama902ZYTY3+Y
         SqQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjqo5nypvxB0kogcCiKe32XxeN2fadQ+9lirwi7LjiZP2ls3InVPt1E7D+hF5lalP1UeHOwC62MeUiBmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqZgYvZnkrJnOfiZ7j++tNoFBhwF0RomkGyTYX2vAAMI4iABXB
	H/0i1Bmq21jHIDAbPfFC4QIxaW+X1ezBDnB+FOdFAUsRJtY7v4xOIWL9SqfoYVE+GiU=
X-Gm-Gg: AYBFou1FAOZpQFTwicEAW8lFa9NP/i8NaprA0i9ZDWHZbIE8kOtRdCG29PdODcLn8yW
	oI85h3YIwT5iHIPXGUXJKmz2Bh9YFucDBGc2ZouQ4nN+7bpG4PFIWhIevNhQnNzEykjcI/Gy+Di
	1fFY/ArWUDXbOt2bSyKzVK6fvrldUJhFv69b4Bn81dJbAvvx63WDurUKlo30fl5pB2U5B5dfXyR
	NSjQIdogenidRLVfX6yt8Sq6SElOq4Kie87YbuJd8O4Kso4L01FdgpkHeKMljx/cmnD3WmSwlHg
	ypkL4PI6OkaPgEG0bNholN6pDG02Cg7kBk3VMKOrqxS2OmPA4WiekKechvaMbIDHyqgQM4JuH6M
	SChokgVc++nO82UuMROV22dSBf7oSK7HGs8dL07+QKOBDJyVjbjptOl2pwXpha9VAmVMrUD7A/+
	aP3LGQj2MdsxaIdStMDP2buOWxpselxaZ9whbpnlgpqinJGdFXIG5A8VQPO7lJEKtsUzoxMoBGP
	A8Fex9oIYu6nYaz/pEJPQa5JwEVTH3VXP+9i5u7ZI0fMGMeyELVLXbjcIyu8Hr8Jez3DoFNTHLn
	Bw==
X-Received: by 2002:a05:6a00:22c5:b0:878:34d7:6a24 with SMTP id d2e1a72fcca58-8a089dfdc7emr1689491b3a.38.1792588504540;
        Wed, 21 Oct 2026 06:15:04 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e416:85ef:f22:6c5d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm889414b3a.41.2026.10.21.06.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:15:03 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Ram Vegesna <ram.vegesna@broadcom.com>,
	Daniel Wagner <dwagner@suse.de>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: James Smart <jsmart2021@gmail.com>,
	Hannes Reinecke <hare@suse.de>,
	Mike Christie <michael.christie@oracle.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH] scsi: elx: efct: hold a node reference across asynchronous session setup
Date: Wed, 21 Oct 2026 22:14:48 +0900
Message-ID: <20261021131448.2692313-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022209.2580332-1-yhlee@isslab.korea.ac.kr>
References: <20261021022209.2580332-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. The concern is right, so I have sent a v2 rather
than argue it.

v1 gated the setup work on node->nport and node->req_free, but that is
not enough. req_free is only set in __efc_node_shutdown(), which the node
reaches after efct_scsi_del_initiator() has already run and returned, so
a node sitting in __efc_d_wait_del_node still passes the test. On that
path the setup work can register a session that nothing ever removes, and
in the narrow window where efct_session_cb() has published node->tgt_node
it can store a lookup entry after efct_scsi_del_initiator() erased it,
leaving a freed pointer in efct->lookup.

v2 drops that predicate and gives the node an explicit target-session
state, read and written under efc->lock, so efct_scsi_del_initiator() and
the setup work agree on who owns the session. I have posted it as a v2 at
https://lore.kernel.org/r/20261021130802.2691833-1-yhlee@isslab.korea.ac.kr
