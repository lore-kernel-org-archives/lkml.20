Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637780;
	b=RQmedjiBZsUYvqRecJzPE1CaK+x0Pq+c9iMxIOchzODjggbcvVJxsVe8N7gUuB9m0kRI
	 ChKWySm06zrPoP6FP6rfiP+Tk+9EShEp6YfWlkelPZ1DT/9bceldc1iZviFIu8nXGFtDw
	 OpuMPmr4rOJEyo5syULobxtlecb/hQ0Q+WBrc+1i82awrYcb4IlT3kc16//h5twpehFO7
	 JgYDgQoXWh5F7W8McwGnrH793zAF/OwcgCA3n8wyXUsOjWkvPw5y+OfIU5KMQO9GYGsmM
	 51IvByDdEiRVg05LuRrQSAE/KIbmTcs/qiZMxb4mDqbupLy8Y9eTaZTLL+10UyuxkEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lo9RrpZDu+xmeeItRofeFQQIM7/msHlPwqtAcJHtB2I=;
	b=5nWFPBAl6sIWqVBuP6WfoA6DNZt0Aj15SvlY3jveGs8GNNqYJXXG94eMbfLS86rInkO1
	 Srh4wEACzsz4yQGFByMXIsRn7WWZSPZbTWaBrj9sq5g6XPspC7dORELE/hQAyJXvEDVD7
	 3jPr2yLTgQAWUXQ/7ZpTLehUf73jDItrSVjOK0kFHi9scAFfuDZ6sYSfO4dho1wFXmKed
	 nY3MdA+rErFAjHjI5Gmfnd6In+fhnBR4UnEtAPfKXhqDBy1pZdYIhdsvPZUgWjvdMwpgt
	 mARwG1Jwk/U5tImlNcwUOSeMo9VMdxgSROLFIE965rCLXmK9OeEneNcgAZhVxNpfvsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDA+YNhC;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40FC606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40FC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDA+YNhC
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987a2ba0cso9271325ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637779; x=1795242579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lo9RrpZDu+xmeeItRofeFQQIM7/msHlPwqtAcJHtB2I=;
        b=qDA+YNhCDqQ5cvNYHPK4O+K5Meiju3IEvGc3XX2y7izqZXS0Dq/9eyUY70QLGMDByW
         hXD1EGYP4kgl1kqAKcQblg3k6Y0GhXKlJSOfqpfD4l8uYaqQqOchi9S5pYtiLWlEBubK
         qdrS3RuQGEaMoPO6sUh/p/nEm1AiyfbC1Gk+ySw1dWK7CBM9Sdre6svsoDqV4me0uNdi
         7jIkPorweWLsmj7vWntk4hWRhVQjqFRG1aIonPJ8QBQTEAyUR9ItAmC8tk2JS++t7wkh
         MSo7EDJS/dHm9yXuAcAsFoxgDtJ0H1zP6bLonWeurOh1mmHM2iIj3H0y8WeLq+68ZS/g
         divg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637779; x=1795242579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lo9RrpZDu+xmeeItRofeFQQIM7/msHlPwqtAcJHtB2I=;
        b=s1SN81a42J+oTKX/K9A5p6fcBFZmQHgnNWjHJMG0GUNm95psjmOWQzVG3VvlfDsXDn
         tG5hMM6mFf6J1CRyhoAZlZFXWRif7knaoQpvsWZ1U51a2tRctCDgMEbKDVoCV69J1Idi
         xMHt/aHfOOdrVByNBrAsw6AsEdHRjXDk3BMh6akTqpwAq92aV3P/9kxdz1ckKKvrKM1k
         QDa22ZJgSLXjRg0dejBzKCzdxbinFxOkZ2zn64W9L3B89NmYQPvR7DzAUOE25Qg6qav2
         Rqdqb/fcBinIhNYVfEAPMaYAz7FRyL2zv9GXBv7jvXNmd6UAXbzbuaW2wtqSENb+2EaP
         Igbg==
X-Forwarded-Encrypted: i=1; AL+hErEg2iDxV4oYvHNvKPPy2MUiDWWzotVzgprrCjclve7jmBppR6I1xbpFIaOv3zPvIwaKTugBr8J98kdCMxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uRCIadr5+AuNUizh62h9zjeC+Wa5coxe950/3LnjBtzFc66rY
	Ye+s6Hg+nCJw+VQSmBWs4nX5jGpNGzmGr4zyeixoOFFxKgvQj3q1coXQ
X-Gm-Gg: AYBFou24xKn11dSGMiW328rkKVSQ42RUDyYkM1WfMH7ALg5ULLPtjJuirc1ATTOzAtF
	U3G1zg/AVlD0tqmhzBEJG/ZC8i4h4LgNqZxKBJ1woREHwPl8d9vGrqbtCDLDmtIPld4rKcs3a5I
	hnJvGCjAm/ba9KsY/Th+8SZWh3lBu2jU2Y/xMBggc7U0+LWMsV3E7MFP1W4blMRBfQ1RVFXVNqM
	hGKnZDmAp1Q3iSTGH7PHUw1ZsYSji8tjTItGtYtYc6qMecKMufTDS/Q6YaP8/iSdXzk9dUTds9h
	pDRsbF5Udkf/Asi4tg7+QnKY6pBvlnmHje3SkKMfl32j9Xx1aPxVbSXl/Kpcge8lx0FTjqs2znd
	x6QtZdcELl9I6R15d3WDuO8/p5kBQpPXf9UWItNzZhxNhbFm0E5tuuBYlIhhmS1tWFTooQ4EAFJ
	jUwIh5A8vHzP5quO9WDd8UZCZqGXasUo8gRVfssNkLPVnNkIz5u9sEAb3wYX93nuII5aZ+N+sl8
	Z6sEO+sErgBW1Mh8XqsTcFWayqRQnkroDrLQEJmG+bFBG5OOVfDsUne9GE8BDW2IES8HSy7Uw5a
	J1UDdsfSmm3kocugrjTrvBnFAsyD3aQ0hJJHrGQeTjzdHdWPPZdSukVMLqXOkvmCk+Evw357COz
	N0hOBcK9UpsWMH5CiMhLTARTsBBerw5MBrnQg3dkcrPa5lD/R6DM8+3iJZxs6yipDNnRdaY1KX+
	nJ3Q==
X-Received: by 2002:a17:903:2b0e:b0:2e9:5ed2:c38f with SMTP id d9443c01a7336-2ee0dc03234mr52576665ad.36.1794637778894;
        Fri, 13 Nov 2026 22:29:38 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f224370sm18382465ad.0.2026.11.13.22.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:29:38 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: dell-laptop: Parse the charge end threshold as an int
Date: Fri, 13 Nov 2026 22:29:27 -0800
Message-ID: <29edd5de9d2d7f90adfd5f9c889e50ad032d2d9c.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
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

charge_control_end_threshold_store() passes a pointer to an int to
kstrtouint(), which only builds because the kernel disables
-Wpointer-sign, and makes the following "end < 0" check dead code.
Use kstrtoint() like charge_control_start_threshold_store(). Values
outside 0 to 100 are rejected either way.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 171728d63c81..2ebfef8e5bbe 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2385,7 +2385,7 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 {
 	int ret, end;
 
-	ret = kstrtouint(buf, 10, &end);
+	ret = kstrtoint(buf, 10, &end);
 	if (ret)
 		return ret;
 	if (end < 0 || end > 100)
-- 
2.56.0

