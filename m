Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9074E31F989
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323357; cv=none; b=I5JyvyWFJ9mkNrdt4oWtch9RGEe2GYIuz+nqeZSiWvC52THtomCSZBas8DIfPb/H3bhQURxKq5ZXWyTsOOJt1utDdOQvaCFJ9k9GbmgM2mtDc526X9AfudsOV5x+4en+/X/ZVFjBDHb3yA6MZTRWEJcswRBNMzAVwQugYVUhvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323357; c=relaxed/simple;
	bh=poluRrFSmDIlB+/zIiUoVzpJ86A8vkad5nYfGvBnzmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urm8Pn3HB3PlMwoZN66BRqxlcUKPiYSJp+ASxrcXCkvrljtEAOCT/VGJE7HmpKTHhZbouWW8XKV0HjR45Zxd8Kf+pPsg9y6e7No9UjAhf7nxkV8xRuWR3IetJzZDIz1A8Hs4MAxqnL1o4NxBXnya4QJfDogs7/ISfczkx7/FLqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=e/gWFdwp; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="e/gWFdwp"
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B1F053F4D5
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791323352;
	bh=poluRrFSmDIlB+/zIiUoVzpJ86A8vkad5nYfGvBnzmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=e/gWFdwp2u3bkjtUfUJu30eth+tyUKW78DbJ6X17S4/giEoVaBAhAZVKX45kxTeo2
	 +d36kJ4AybcRy2wnd4zVlT/5a5vvse/7+DGtNnWwoDGduqjgQoavrAzeLQWN1oTP4M
	 IOxwSWRFI2pIjXLdoVS6YAVp8izIYKktMUB4NgwB5bOcXLuA/bwxCbXxpLJ9Exfyqb
	 vwt3Txr3uwj8gDx4uos4UMlHhh0gOa18iKssQavSDdUxoQDFkwU/NXSfPuiz/iZ3+U
	 Bw2eRxrbmdXjb03e5U3gFCr4C9bVOq9/Cxnu+aXZyh49XbX1tcp2nX5k8jfPzHD6Qu
	 2lui6CXNoTdEMLP2h4rvfWDkETa7Xk4FOgrP3ELJO2CJ0dzObLl7mNmEQY7FgWEU+j
	 buAVuTYiswjs8WI+Ni/eqpW5drJ1Pdrusx01GNdI5gDPACgDFGYqjshC9zlR8kOb2R
	 BZDM8UnkjWEd58vzclI39+sJEbmyXlv1WrVNG5oCiYTjMFF+O4xzfr2+15WoR/o5cH
	 R2YUXx0la18ZUrJ06GMlovVBjUuMqWYb8BZMHNXBQYnc2kwiSIKHDmR7AMAZp6VdtW
	 QU0WkWXwkVooiknFypSKQBgQequCQi0dVOiKrVAej6gBLDWDv0pzzJfpo6qCvPtofj
	 5Yoo88kaofsYyeEhyySzRYJU=
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso4049252eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791323351; x=1791928151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=poluRrFSmDIlB+/zIiUoVzpJ86A8vkad5nYfGvBnzmA=;
        b=r+9aBOywodROik6q+RHmCXRn3OtZBJSzjqCwlpuShCWhPLb1VIjTGud37/UOzP/7yp
         QLYkfBWrLYwyw5Ie9mqh4HULKu0G8lGNTr+k3RKV4S4fzlX3jnxAVYKQHcYEx/mYp7dJ
         ORSfB+aJE3Cg1oOFIArTypVr+PnL4wOPdEM1/TqTJ3U/g7Hk6z8r7kVp5xGKEMe9c709
         /TaLNTGNYG8haMUOH1O4DDmtqiBg2/XNp8XICwWSuvV896mnafigCxesZoiDUw4MyWAz
         0/92wU+ZLDU6XEh/gDVDVkc6gOle4mUFdyVybb8HKPQOI695K9wrdWH1nehVyccLoO5U
         mZVw==
X-Forwarded-Encrypted: i=1; AKwUvBwm2a8Lr7GQqXUGcFz4g9dZn0boA8PrN0550kaVtWwiR5NkFGdI9Kbfn6bAvd5ScreriqtW/tbiJv2kZTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM+IddT4IZuuu9Ug2qNAghCaWngwY3DpwVahJT3mKYfPw32t2a
	XSQT3P880p5PaWvOR7FB5xd7MWEzQ8oyNuFjiFyIiBH+YEQ8eMlX4MktIIOFQrDEhY5xcM3hocB
	SR4TBk5P4HDFBN9b4FNxR/zENxkzSdB55JviPd0qvINC1t1RJP/sTeos4TBFPxryQOvilcOEQv1
	QAOOqdJKCddPSwfA==
X-Gm-Gg: AYBFou18SxibZ1Kw+aZ1AaMaIHYQOj9j47lrgPK0L6ubPaZxN1hWSKr+g8xfUkiS3Xd
	7ISBC5vFneFlZ/fM+HwFcCrQ3zLzLuTx2S6AMB+uMVhR/EwWauYETqsWSKXBZqDH76i0Mq4NA+k
	qevlRdOvFhVSZN3l034YmP+3tdzDlR2jBjSJuKpxrQ8chM+eMhWNX3FHx/wJnorJLoAlVWu0y5z
	vEXGsD2WVZyKA9sBUOHcGf5vuPwg874zhCaBYzBmtVBEHy1XeNLWaBgtWzIUdRN138A/8i4l2xs
	a7qdTJaoC4IM5RHm5JRG8Rbx8eziNOQ40/MY6oaymyE7ewqXVwDG901cJL/ihkcl1pJc9SGbqVm
	9csv2t95aD1Y8kJer/Q==
X-Received: by 2002:a05:7301:db0f:b0:33c:e74:4625 with SMTP id 5a478bee46e88-3515de89918mr138833eec.28.1791323351115;
        Tue, 06 Oct 2026 14:49:11 -0700 (PDT)
X-Received: by 2002:a05:7301:db0f:b0:33c:e74:4625 with SMTP id 5a478bee46e88-3515de89918mr138771eec.28.1791323349201;
        Tue, 06 Oct 2026 14:49:09 -0700 (PDT)
Received: from localhost ([2600:6c40:657f:4180:3a1e:4952:21ef:b8ec])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afd00e0sm1271255eec.23.2026.10.06.14.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:49:08 -0700 (PDT)
From: mitchell.augustin@canonical.com
To: abel.vesa@oss.qualcomm.com
Cc: andi.shyti@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mukesh.savaliya@oss.qualcomm.com,
	viken.dadhaniya@oss.qualcomm.com,
	mitchell.augustin@canonical.com
Subject: Re: [PATCH] i2c: qcom-geni: Restore the source-clock selection policy
Date: Tue,  6 Oct 2026 16:48:41 -0500
Message-ID: <20261006214841.202946-1-mitchell.augustin@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928-b4-i2c-qcom-geni-preserve-source-clock-v1-1-9aded7552a76@oss.qualcomm.com>
References: <20260928-b4-i2c-qcom-geni-preserve-source-clock-v1-1-9aded7552a76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mitchell Augustin <mitchell.augustin@canonical.com>

Same issue on my machine. This patch fixes it for me as well. Thanks!

Tested-by: Mitchell Augustin <mitchell.augustin@canonical.com>
Reviewed-by: Mitchell Augustin <mitchell.augustin@canonical.com>
