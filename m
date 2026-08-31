Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D4D52FE31
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183895; cv=none; b=n0sEsfox6k4y7nvZuAW8MRJ3Gc2JOgdwQjGGN7/Nis/zDLCalakZ+wNMepeFVVnHHzoGeNKE7G6NbmlC6EnVpik+yaDrlpKG22dYfZrdEiU3vszPkCiyP8WJQkbSKUzSvLUklatyGwr2UKUDiakgNpu1HDKggCo32AJRjiuPZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183895; c=relaxed/simple;
	bh=Lwd3PeZ4xmhycpzeKv1BY13CWcgT0j3f+vGChTb5o5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQD4kLEmRIS2I8kcUdqT6SyZyso9xVgTrHXbf+dtj3gtvIjKSy7P9EMY/sLfydVMmerP/dfhSr/6cAIoFnwnmzbF4b1lVYncxIAWTnCCrsjhYUd0+Ca3JuBSfU8rcBEBOfKt9R61qDScxDR5UQ0b1LxgQ5sWXdtKBXLVCm+Vk6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1XCzVun; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1XCzVun"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb2513ec378so434863a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183893; x=1788788693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lwd3PeZ4xmhycpzeKv1BY13CWcgT0j3f+vGChTb5o5k=;
        b=U1XCzVunsvA7mNt4uCfvpGStf/QgY/24/2tWUv7dFhsmz+qO7yk7R/BeFshQ/BX9v0
         OQ7cQGok3uxtodBpzRIVhy0/+DrVpnC5Ub+mVI86SNAEMVrzhiGUV5mq0pTlPfcrUTyk
         kbt4/tFKxY9TeE9qofV7vqYTklnh7dVLP+KM8/HvGeKLi+E9Wc/4tVWl3/FIR5jOQ4Gg
         2NdG4Z1EPu0GyBimg7COrn3/jHIPrjtTbxLlIyjIrBbx68nhMqIEdvVhpV9LUNa24KDL
         G/mTdEDtnbzwr23oDEujgF/evot1vMxndAsMF9PxKDWvNP6dD44wKR5FHA/+AM0wZ/f5
         Fz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183893; x=1788788693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lwd3PeZ4xmhycpzeKv1BY13CWcgT0j3f+vGChTb5o5k=;
        b=aC3e7SYVcp5NTAZkcUDJ3ToWMb8mNl7NkFDPG/oihTIKZG2Tj0xOOwsvCPnxH++EOT
         AN7q/PRuy6kiby1hu0PtnwQVjZilizA/kNEzeaukXzpkXprLNDGl8hku3uZznJAsSHgW
         n2nCRogUpswhFGdtbAj5cyBtHKxgYJq0PfN/U+7AI8Y9aiINOPZv+KreCo8D0Jy2zexz
         xHMfo3TXBxlV6Xj8G1EQ3mcinAcLMTu+Dntc8AgS5zqWvllsH0kFGPr8N9eFCvH1ffJJ
         dQ9e12x1cc7kNvjmqIEWNB1zDm0m9fVN1sxsTaIFp5rzEL3MbpXwknyBeO1/vV1w2aVE
         nRaw==
X-Forwarded-Encrypted: i=1; AKwUvBwBB+gOXUcNT9e2Q8OvZndqyPU+iypoMgPFgT2OBcEiJ/r9nhnZY+1Cb+A9yPHBa9qJZV6T58BExZ3w9EY=@vger.kernel.org
X-Gm-Message-State: AFuF++lnfojCVlDpbmAEwASUO7eFyDtkqDAm0L7Rk40kG6Q+GIgk3niV
	nXD8ezHEabrdym8Yt41GZJi1ua9YTOc0YAwNFjsE96WOdxgiPoxQ6n3o
X-Gm-Gg: AYBFou1oam/MJeFxHJMGGhdVess4cXrMUANqb1OVa1LNXm8akwztoAXdpgy2Or7EH+5
	DEJM+EWPr94+TTKWESbKfbEwRZW4/uKJvSfBXhJUJ0zKSjTpZ6QykO/g9aDS/0H+eW1zAqmoF6B
	o98khkLrCPH9cK0zTfRhy4oZE538491PnvwhRjziIY36NLtwRH/mKwgHQBxOw6kEU4Z/XDvnSB3
	RhHjIyNb0td6qIwHxFWwfFW4fEJz5EhXDPgdFdhXM/sEQ3YZacU9bRLsCCYVhpIncfCy8ejb5Im
	PhL5UwlxheX+oGqC5sDmsY4JliXavSqx8jTeBRPu3sL+qMSIyzBTy8oF5wwMBvApmfusYaa6QaO
	XlCc7e6zeUua/g+CyHXoEvAtAyG5hytDL6U5ZJn/VWIYp4BnFZimFnfUj8Zo5JhCmUkdOL80xIt
	JHXwlCb+wzdGneCklTpchKHqLjjyZvgGh6UI5JdTsekd2IdqCAtR1q7asM6YwrOLlZ6AcAW+hKL
	aOAvanrEFkXBGvJQuYNSC4/Uduu
X-Received: by 2002:a17:90b:17cd:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-398bad20e70mr11350710a91.6.1788183893034;
        Mon, 31 Aug 2026 06:44:53 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm26725626c88.15.2026.08.31.06.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:44:52 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: linux-wireless@vger.kernel.org,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless v2 1/3] wifi: iwlwifi: pcie: don't infer CSME presence from a failed read
Date: Mon, 31 Aug 2026 19:14:47 +0530
Message-ID: <20260831134447.490458-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831131514.3A1FF1F000E9@smtp.kernel.org>
References: <20260831130332.323549-1-navonjohnlukose@gmail.com> <20260831131514.3A1FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fair catch on me_recheck_wk. It is pre-existing, but this patch widens it:
a poisoned read used to take the WIAMT_KNOWN branch and return without ever
arming the work. Sent separately since it stands alone:

https://lore.kernel.org/all/20260831134140.480276-1-navonjohnlukose@gmail.com/

Worth taking that one first. The TOCTOU on STATUS_TRANS_DEAD is also
pre-existing and unchanged by this series.

Thanks,
Navon
