Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE742C11F3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618112; cv=none; b=buuCePQN80LPY5mLUGzh5hIUxoXCxsGoM6AnpKXXSxa0+bpMUwm05u49XFS2BxRHqE9R6GhrnOiJj0viGJpTKeFqgTBlQVXSLnGCNF/mQYNBBjanH+VwnnZbwrK9D9fbz1GlCBVwgeoEds8G+0YfplCFwCSbNI8PJWrsn2FoYQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618112; c=relaxed/simple;
	bh=zs9gberxS0wRfNF8TSFnYf/aqe/VTj9M6kyeSUqMODA=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=Up5VYHQG6/uupbL/mX2vvb58IJ8FZp+tPNCKpYvl6AyUyfsNRimQtkOrWUINFWV76t9sFIRzXBsT9BrpG476wLFNIQKtQbw6NRW4boC+z6AzNaKik2kHqro9IZv8MtUqSdv9M2xtMmuKFJu8UXn18h1phCoEhKvVj4iVKHD555c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfXSF6Z6; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfXSF6Z6"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab18so3687674c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618110; x=1791222910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPllDjkKaargAUH1bmacsEz66q2/WWpXsBXhzb2KnrI=;
        b=TfXSF6Z68VG1U3zTE0gSKk7aGui+JEgUU3E7lV79LOS2MX74ZU3LQOZDKVYO7pVnS6
         DcG2Nwo2YSmbyUuVxQW/PSTDX9vgD6YCY/k4HbZD64UYjwFDmLLBL7p/P6yVRCXcicWD
         U1wRGuLPHnsizDkXSx+KaobPBx7gb8MDcQcBrjLfCmCxezWF+sLg6MrRcHdOcKKvfEtL
         m9Os/TLdEYuwUt12ysepaMZNQckBcFev87XVe/X18HxWO8tEtc9QB7j43PcCzaeMw1hZ
         ahN3OiWiB831/wxGLfgaYmxNlN3ArUepv8gGOsSZbx5mR9bf0ohOAKeLAlEfHwcN0t7V
         kVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618110; x=1791222910;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wPllDjkKaargAUH1bmacsEz66q2/WWpXsBXhzb2KnrI=;
        b=yGT49B/BE/XHYRGPl0mICUn/SghptqY9M90mPpWQf4kVwBSg7LeA1zAtTiubKA2Sxl
         Qvg4KAWeHBG+V6A7HNTZkOjULZ3VwvN0ce0cIr+UXkIAgamF0tIiEyq9Qpmcbk9l68m/
         1/iIahiu1CxbYAJTbC0cMI0zyBlewkxYHYpgK6mE0aImGW8EzVYA/WbGVwjKBkEWpCyj
         E6Ss/HxSpz8uqpZLA4no4z7nFawnQ9AgDNGpQ0OuIJXy7ioFiHeTO6nNJApK8Okyb9B5
         nEcD/VGw+cqdos1KSWr0tEGw66Ej1mPS3lyPOnpUgjryeQyUvde7r3aAjlONMP33mriC
         6gXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlwCdw+zOJiTdREAkxorLQuOuz/73cRrMcVQa5yzr0Ff5kW92JK1XXJcnTR9FQa9EPWXVfT2XHNt/xSmY=@vger.kernel.org
X-Gm-Message-State: AFuF++mjceIYcny7DaZB49cELXy/TElKGOeHrWEmmAz15RXT31K4vpK/
	QhLsMgYcvpgjrji7YqiQ1lLGTiTugYpoIeAYshQo712ILSD12dUX+VEnl0OQMIU4
X-Gm-Gg: AYBFou1IW2jjtF+dxUofSVjz/6bH14WFak8MQcbpeJ0+y24y0zaJxze2iIF5OrZ+BnS
	VssKmY4dQIFyqr4eKpm6Nz9NdjGREtERBQ7afERhaVH6vND0rvFpSfpcBCzAIhiAL4Z1/zn4WOZ
	QGXYJoN8OotitbFc4NSKdTpFhf30h3qOfBHfIHnSV7twxGaGt9g6J2N4C/l44zoEdAiQ6rbnacO
	bwN5KZkhCIayo8nymJCHQAjBGlzS9CFJAGeb9skdlVaiXwxwurZihJQDN56rzuN9NknzSX63Xth
	6E7vOZcG6Cye3hBmEAeSmNlzYhgZrM72h+z5PM0xLDVNnUmnG1O96GS3WfJxCywAXgWpkMNdGV1
	xNsYC1n0KMbHhesr99kpHfAsx1t4HcN8NKOdWgeO7yoqn2nSY6q7Ea/5eJIXePWzU3/wwI38OFM
	kyq9UTBFgY6P8OkWJak7lNm7bVMIbERfFvzf34TkMDoDOWb3XLUhqkqILPYqKw5wGh6alZsisw9
	Jr4n2uC3Ah0vsa/VUFWQhEHKtmaIN9VnusdJiKL4zpQsApQhq5yJr87EU4BOrm0iEfQsNSqOrft
	wg==
X-Received: by 2002:a05:701b:455b:20b0:149:49c:21b with SMTP id a92af1059eb24-149049c0391mr5721949c88.20.1790618110171;
        Mon, 28 Sep 2026 10:55:10 -0700 (PDT)
Received: from manush ([2406:7400:94:b571:88c4:97ae:bb47:4040])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-146bb6551d9sm18462130c88.9.2026.09.28.10.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:55:09 -0700 (PDT)
Message-ID: <6abaa9fd.8a95a640.187520.71d6@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: ukleinek@kernel.org
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: 28 Sep 2026 23:25:09 +0530
Subject: [PATCH] pwm: tiehrpwm: fix copy-paste error in obsolete DT binding
 fallback
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ehrpwm_pwm_probe() attempts to provide backward compatibility for=
 older=0D=0Adevice trees where the functional clock "fck" was sup=
plied by the parent=0D=0APWMSS device rather than within the PWM =
child node itself.=0D=0A=0D=0AHowever, when devm_clk_get() for "f=
ck" fails, the fallback checks:=0D=0A=0D=0A	if (of_device_is_comp=
atible(np, "ti,am33xx-ecap")) {=0D=0A		dev_warn(&pdev->dev, "Bind=
ing is obsolete.\n");=0D=0A		clk =3D devm_clk_get(pdev->dev.paren=
t, "fck");=0D=0A	}=0D=0A=0D=0ABecause this logic was copied from =
pwm-tiecap.c, it mistakenly checks for=0D=0A"ti,am33xx-ecap" inst=
ead of "ti,am33xx-ehrpwm". An eHRPWM node matches=0D=0Aehrpwm_of_=
match ("ti,am3352-ehrpwm" or "ti,am33xx-ehrpwm") and will never=0D=0A=
be compatible with "ti,am33xx-ecap". Consequently, for any device=
 tree=0D=0Ausing the obsolete "ti,am33xx-ehrpwm" binding, the fal=
lback never triggers=0D=0Aand probe fails with "Failed to get fck=
".=0D=0A=0D=0AFix the check to test for "ti,am33xx-ehrpwm" as int=
ended.=0D=0A=0D=0ASigned-off-by: Manush Prajwal <manushprajwal555=
@gmail.com>=0D=0A---=0D=0A drivers/pwm/pwm-tiehrpwm.c | 2 +-=0D=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0D=0A=0D=0Adiff --=
git a/drivers/pwm/pwm-tiehrpwm.c b/drivers/pwm/pwm-tiehrpwm.c=0D=0A=
index 3a53489f0..40166c5c8 100644=0D=0A--- a/drivers/pwm/pwm-tieh=
rpwm.c=0D=0A+++ b/drivers/pwm/pwm-tiehrpwm.c=0D=0A@@ -426,7 +426,=
7 @@ static int ehrpwm_pwm_probe(struct platform_device *pdev)=0D=0A=
 =0D=0A 	clk =3D devm_clk_get(&pdev->dev, "fck");=0D=0A 	if (IS_E=
RR(clk)) {=0D=0A-		if (of_device_is_compatible(np, "ti,am33xx-eca=
p")) {=0D=0A+		if (of_device_is_compatible(np, "ti,am33xx-ehrpwm"=
)) {=0D=0A 			dev_warn(&pdev->dev, "Binding is obsolete.\n");=0D=0A=
 			clk =3D devm_clk_get(pdev->dev.parent, "fck");=0D=0A 		}=0D=0A=
-- =0D=0A2.46.2.windows.1=0D=0A

