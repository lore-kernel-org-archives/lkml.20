Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794666183;
	b=VNWQyaQ6IL7bTVCAcpK7qyCEVGrdxBUUsymE5Ypjb1W2FZ07OSd6O1c1SRYK2dTeos9M
	 pM3sRQGszLwVzl5iJpDwsofg7MkEfVBQCxG8OwaNurfq6w2MMXKlBUginQ2L8DB0ubciH
	 lKTj00pWFEUTdOswyqP7BXc4nBskymbkLT4MmMTtCL76rohRRtKO7LqMkAVptk31bcaFN
	 f7whYV7WpBRi/IVI+UfQvyF615Zq2d3VV02zb2DjwsS3NOIsg8GV5lqY3yci2JazNMlQK
	 TCsA093UJATHmkWa0lSVG3ZAuYhrW7kGcppQs4cqbuVhILHdXogl4WY+DM07yewNjsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=g/yvbWQwS0D23DkQr1LFINSHz9ilePwn2uGIL92kEuU=;
	b=lwWl13oyGe3izjrr26afbqVlfuYJvecZ6MSMIptlrZhByhghvzzCJY5qW61an277zmr/
	 i+JyKXKKEzbhZc6a+WxQEZkmT2ivi1JydKkwcVoyc0ypgpiPSgYzxbxK9V4WZh/sxh47s
	 9rm5bZbYpghrl/fB9aebQ2HiLazQh+JYTnjxYAksPOhJqUwuLd0ekDqXhvmRJnyadI1jj
	 hfRgDoAI9eTo14Pc722Fniwfc0yeeGtJzTSbC+yWoGrhzoySw8SkAy0EcjJjSfU6yFRzv
	 RwsUPAHROZsQaSl+aYy/xpNaISDV/5v0SltQks7maxdb91h/vlM/b7Qw2bZ/ovIzNSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0lFeNKA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A2606A895
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636A2606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0lFeNKA
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53fdd2fb171so33095791cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:23:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794666182; cv=none;
        d=google.com; s=arc-20260327;
        b=E3BQaRD+Jmia8ELPZkoNL5Kj/I1BndtGcJ9yQwZJSz/Rliibg+HEl/cJ/n87cnbvr7
         SbSLPosvAuZsdw2aDMWM/Gdz3/6hOb3jeMA7flXn+SCX6W3fXfu2hGmrkADL+vyGcs+9
         GqR+DjMUqhhyJs0Oj+Au4JvTHstfGzmUHdJyFqwIFVrVRdSqgwE9MZXm6mVYCAj7OPqZ
         KnUC3/p0+H3WsSoh/eM67U3m5vxJkYa37yWOLXQkOboAIrMjpgMwtfLN71uXcE8pxfvC
         EwjS8Y1cU5FZtdeXWDhcv+RZWBQSyYpmAzBiiPZ1IokXlRLJit/ZZSLOtTD/ok8ZpiQD
         N7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=g/yvbWQwS0D23DkQr1LFINSHz9ilePwn2uGIL92kEuU=;
        fh=r8NpoA0rzc/7cAm0e9fi/2kidWkirAVlVSWJCapMV8g=;
        b=T9UQSPDVJigU7U+y+Mq87PZtuL0Z2sHL7Z0OoZg5no/7eXVtSJujIUoz0+TY2munY6
         PwM5GeWHCcSSbIC9uqbBHMg3OAVE2fA9S9MS9iub/SR7WSbyb5NlWSQ4de9vh+1b+VOJ
         bQniPb+civX6uvBxug8MmqV512P7weK2wyMDjBvNnPZpBCQd83QKjMKgY9z/6KXZcp+/
         59s2FH2eNmmW9Y7gruRoykJybLVaKoCt1ZsMuXyxPHqHdau1u6Ff0KV/36YOB1RSGahG
         T3lLdZygf53RZqVFFPBqKTWGK4BjEakaC8IIqh5RoSpT/vwSSeLCgzERMJ4zUDhH5Ymb
         EVnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666182; x=1795270982; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/yvbWQwS0D23DkQr1LFINSHz9ilePwn2uGIL92kEuU=;
        b=m0lFeNKAVoAhT30ZIT4r7jcnh5s2TAoF5yLrijhFQ3/wvWXxz06ByDtrGLJ5CFxWk0
         +qPNz6lB2qBCMzECEdu7ZYW4GVCmoUV/KT9gGUFqK1PJcJ8l5RF7DOsyDWsAtI9hfFlX
         2s0yZjXaY1iYGBk52/heJqwPhpEtyuJAEGDQcUXzhjvLH9bAcn/2/yFN6/P5n+2FjCZc
         aFNRwZv1ta1e2Rs7ZSpY1m+IPabaYU7CS3InBs7GLqiQ352XgXOD05REQ4E6zgdT1IqC
         ut/Y1Lu7ReJKh0Yq5v8e4JwB8wKAnyKjk0m6Cfr3t6pgPiaGjWbjBsxSa9qen24bwqRn
         IjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666182; x=1795270982;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/yvbWQwS0D23DkQr1LFINSHz9ilePwn2uGIL92kEuU=;
        b=lJlv5ROMeCob5JGRcAoEooElst8fUrMxlX/HMUnyhbcbbXFH4AqkrjdHmZJDAg7Lj3
         R080xD09A0nmjTl+wzqiiPl2cL4NzeoJDw852GeIN5W3GIdzwoNlnMh0/jzIOFdX+kZ3
         18dh1j/v+UclFj7GVIyfjx/nxf0vilhayZ7ElWs/AzIpx+V3hn2Cf31QPxHVS7J53pRI
         QvM3Xeh7+q9O6Ia851stRDxGQTiBCZro0LxW2TZvup+k5cXMLGDr/XjE1lzJAYPfmLg+
         xWv3xP3WhW22zlCYUf1gUOmECxbPxlMaXtzZ7fcEahOlCVstTsLHGjzAwlfoN4mTz1k7
         aYcg==
X-Forwarded-Encrypted: i=1; AL+hErHvcP66N5msPp9yqk99ciXcsrd09oEOjlEJeP5enTt2CgQveKAcKlO+SHoiuY7lacZOAWqfJ3suyelPYec=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nyWjDUnSGWGc/84/5OT2ATdmNQoPCqyPV3TmIh0g9NMoBqv9j
	A/vc+0sEzEeR9M++YFuB5gzkLQHWHq5bp3LKZRWd9Kf1TyBGvfgCS7grCuiKzFyuVTZp5I+2WW4
	EElj3jLbjJpY2JDBVo0lDEgpwJBCPQE8=
X-Gm-Gg: AYBFou2fhnZMtLi/yAO/QotgCDce5GdAhfK+3k3qjE8FIlTJ4PpiY6ad1jgtmRcWO0Y
	580hAVd8mvYG4R6cnLLNkcmCA27gu73vJMddAUNtHvgYTPdnmYO5Loyv0cg3N9Q3pKenX9fqwr5
	7tBKMpFYYNAbEvjycftEktc6l+Lzzzb0gt0RuZHMbSjwYej7jciFxkP+8i0qE1+6YHSQFVIKD1H
	Vm3S7HzeWCD7vl3+5rQcis6Ffkb062xiGT//TbHeFc8UhaimWqyn2Si0TVpElSgS+FdwwvrHIzb
	Kl/oe+JZFaQUXrfh0+e/djRJxRWwHu4KK3MNwD5OHd0TyV+bj82GOG1Nh4Ur4TMQeIz9FgdvJi0
	w0k9ZP5n4RrdTRSUNmtc3Sjzv0KyvI3yR4mvufBs+PnfOUKn7izpBAsbifcwxmgVbFt/5
X-Received: by 2002:a05:622a:4d43:b0:55d:13c7:c22d with SMTP id
 d75a77b69052e-55d13c7c71emr12350761cf.73.1794666182235; Sat, 14 Nov 2026
 06:23:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sat, 14 Nov 2026 22:22:51 +0800
X-Gm-Features: AclHuK-CwagvkWalezrhVz50u0px-Nhi_i-hMu9i1eMIeBIShkcfnpv5nVgK5r8
Message-ID: <CAAi4Z-fjR27iAXjb6VpovSVVObqLcLgurzuhCkDFqgGafyAaDw@mail.gmail.com>
Subject: [PATCH] bus: brcmstb_gisb: Check required IRQ lookup results
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

platform_get_irq() can return a negative error code for the timeout
or target abort interrupt. Passing it to devm_request_irq() can
replace the lookup error with -EINVAL.

Check both lookup results and return the original error before
requesting either interrupt.

A similar issue was fixed in commit 47c3e06ed95a
("spi: tegra210-quad: Fix missin IRQ check in tegra_qspi_probe").

Fixes: 44127b771d9c ("bus: add Broadcom GISB bus arbiter timeout/error handler")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for ARM
(multi_v7_defconfig). No hardware test was performed.

 drivers/bus/brcmstb_gisb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
index 113a09e10328..c0dd2e3205ff 100644
--- a/drivers/bus/brcmstb_gisb.c
+++ b/drivers/bus/brcmstb_gisb.c
@@ -419,7 +419,13 @@ static int __init brcmstb_gisb_arb_probe(struct
platform_device *pdev)
        int i, first, last;

        timeout_irq = platform_get_irq(pdev, 0);
+       if (timeout_irq < 0)
+               return timeout_irq;
+
        tea_irq = platform_get_irq(pdev, 1);
+       if (tea_irq < 0)
+               return tea_irq;
+
        bp_irq = platform_get_irq(pdev, 2);

        gdev = devm_kzalloc_obj(&pdev->dev, *gdev);
--
2.43.0
