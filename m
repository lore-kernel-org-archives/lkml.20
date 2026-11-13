Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528920;
	b=DohUsdS86f5N4JKaJSlKhUaD9Cp2rVIfJ/s7bEFAsblpPSsRfcWY5IdDGq4sLBTDFFwu
	 mxrgglwKD1Ocykw4q3npL5+V3s5dH+j00uds3IpzItWy7yoAAVXeXPXFcPgy7DaPqz8IM
	 nHrofwGI3f3nxZtRJr1sjq+IGjdsithPEFEtfUsHgSo/tfEFsXmaN4uvKQ8aUZ1WEjLg7
	 6cdIN+jqksW9w+ZSBrjJcyVcYFmF7j2ApwOLbMOsPQc2RUKojaFUNnx5UeRfhUlG+NOvE
	 oVDcN20rPZd7zx9NvzjAYRVnlctSY+bsj1AflPtHdGudoKnguOHFjGWeLlIWRx2hI6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JxOcaVWI6i/3vDXJ/McBySoTqVwECLMhKYWlZ9iPDsA=;
	b=qFmICFZtKI219VCvBGhG1E1nKKcR6SrKPvuR0XzGssp5Z/c+U2QDZqEAX7C9vxtPSkpe
	 tn2a0sB6XgP+NaoN3XG9tln6MJJNjhWQgJgjrY1D6LP28T9vxHCUM7jfJnGuNGzpmhsbm
	 AuxeNNBS5qCNpY1dwqpo1HTNAP2lhIx+j7VP6kDpdmEbLjOMjMiAsA0RUukZ6AUiOZV05
	 r7sEnQb2vL0NmgwZEkaxolIEAfemehZH3LaeoKThPCr25ywh2ocvAcI9SAIPzLtNHDyCS
	 47fH7cuir09xg2JfY/2pYaHtDGujKx/+saXWGsIyIAP/5Os3+2v2/L0JBU6HL23UqQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdQTwI1e;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85BF606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B85BF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdQTwI1e
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so716820e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528918; x=1795133718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxOcaVWI6i/3vDXJ/McBySoTqVwECLMhKYWlZ9iPDsA=;
        b=OdQTwI1efea5j1xn0K4k+TOBlQiWRJUfVPgOUhEXGLwqn+mmEYon+bPWcfpoJGPkMG
         dD6yqrmVbDR8KtlQY2Bm5yv+hBwLuWv4i+0zzI4+WL45RmlS1SDswX1mie9ZpVu+47dJ
         SKFaNblFXHn+HoSmbl5R53rDrcNHRbF5hmxCWufP4vZ7V5kIholUiImEXrCtOXKlG55d
         xANIeOAaxtSvlKysoroBBqzdrzP6h5XPGfkRM+I9Oj7ByorqNGZOaBXHSOWYcEuMy0zW
         zLwWNb/rp3w9Z31O1mPvM0Uc4BbgnipcVd+hR6SfHgqf+wZCpMzj3kuXnx170TzcSKDS
         09vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528918; x=1795133718;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxOcaVWI6i/3vDXJ/McBySoTqVwECLMhKYWlZ9iPDsA=;
        b=OM/OBIU02mjVp1xJ8mFVXDPsrYgIES/eoNLB1ZePAvefBdmWaC+J1bYAf3jcKTA5Zy
         8CrFY7d7LBaM5hytKOiZyMTd4Gc2vGCesSMJwa7tv7jyDdiiGr8vBWYJPB761uTBvwK/
         QDkKIy7BGg6pEd6Qz0IeroGUpCDCGAG/M8aDCt30U/UOjD2W75O9nc95SyC6G3Dtru7D
         XPKpgpHB8WdhoHjYt8fwi1oxAe8rjoPuuqeHnY6sHbQxKqAqxHV9nm+oa2rFR9Rz86bA
         yiVxkpAiJhfz+R8KbI/HnIMP3U5cPiAnS5+95ZUr34waz52DjwibJcd3ukeKfW5NW4tP
         o7qw==
X-Gm-Message-State: APuU4Z9Mk9Jw7XCQIbr7pcLJxJx3GsUSoXkgztKtCqBmFEvomjNXgYZI
	iD7aHZWke9TbOGbULLypJ3mARW70tkKDh4w9sCz9lBPGUULMIKYJZ/LS
X-Gm-Gg: AYBFou33KjGRQZ+sr3qF0ybGX9sHlydByRmHtUWbG4lN7ki7TvcSfJNhwHABz84AjxI
	aT0M6OjpCEn4XhTcmEBbFlsVWSbEItiLfF9nmAOoMqrc+ey8hFz1klseycWWUfYZi5Tp5JJBZ+i
	kUWo83W5YIwiQeIKcCMoKUEG7oPMaEajBgvXBQ24XupiGW05PAqHedYH6Gs2E3kQJ5i4eysYQ+K
	SbQgtOwFT6ghZXXhqSPmHAGCHRyMuTt7wEo3lBDkoOJAY85U2b/nc2yefGCC+3dbUmNZh29JM1u
	MGFrNl8gj1UUOjjUgjxO1DWDfhMogh+yHGII3VtdeTPdygrDOBve0jIiU50kCF2XsLYHhmfsN5+
	2NMatJM2yWYoIP713EmxQEvxDy0Y7YoMQ44iZX2REqQNVbJ7cfBczHMz8VWNEVVRVkIuZsbzRKV
	kEnZkzlqJGV+7CvVFKTAzlGpkYAfL85GF7xw5Zk6uCjUnvcqrQctZzL/9NjKEZl8IN9Y7LCwNbA
	xfs99nll4DJt00URT/qdd3KUJOdc5EOFdF0IuXw5iic16cJxznwUC030oetsY7G9pCPU4PTsmtH
	GlYaLklLm4a4VD6T0XPk/eZr5n6VnEy8kiD3VsPX5+XYnmLqGiY5Pq73wWiWfeAQTwIc3jILuD+
	v4pOPrEIShQ==
X-Received: by 2002:a05:6512:3d8b:b0:5c1:52b1:ef8f with SMTP id 2adb3069b0e04-5c164eb3172mr1490770e87.31.1794528917830;
        Thu, 12 Nov 2026 16:15:17 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:17 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-openrisc@vger.kernel.org
Subject: [PATCH 05/10] openrisc: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:11 +0400
Message-ID: <20261113001432.128201-6-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/openrisc/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
index 73ffb9fa3..c46899806 100644
--- a/arch/openrisc/kernel/process.c
+++ b/arch/openrisc/kernel/process.c
@@ -129,7 +129,7 @@ void show_regs(struct pt_regs *regs)
  * Copy the thread-specific (arch specific) info from the current
  * process to the new one p
  */
-extern asmlinkage void ret_from_fork(void);
+asmlinkage void ret_from_fork(void);
 
 /*
  * copy_thread
-- 
2.56.1

