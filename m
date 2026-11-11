Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395725;
	b=COIKc6kRu+vlRGS/Qg5svlGzBRYmhq5Xukk0S/hE01RhnitNL5FMBjxDcSXnGWdnnlji
	 m/WBD4pYWrzJiDD/hRapwdBg9LOP5RlctO52hbN633vQ/LtIxPu2eipHIkBN7FKyw/kSO
	 tWfoUAUlbOpXuEfIuJ98vn3QKbrEM4nbsK8wCOeFjHQ9cCGrrVWDQNcwHE7bNozWwxxIC
	 VNB2r587bwaOt89AsVx1tf7Mv14yOMi+qy4GDZwCVvoJfFvxAnqDsetlmFYhEybdP1TzM
	 mYAV744j0x5CCoAnbCMfNwh/MnXfDmmpnufyCbmeHThIWdxu0zHgBFbQbHP6WCGLGow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Mailer:MIME-Version:From:To:Cc:Date:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=lbUKZdEyRLlv3O/aIgaEEkBaoJXsJfgjB065TzawuKc=;
	b=ogZgnHJ+cBLDL+fbT5ddmPgFtcdTuaJoi/gypcju9YIuVVs2ojy1oq4jslCDqu9bFs0R
	 YuhEg5RbmnBxLIEJ9zZGycSMLBL61czTlVNmON5RQ0/3OSzG2n4cq/AU+QzghctFbtYbq
	 +5N5aB7ayw60bVutap3OfUiNY2loSTNp67QLjwgucLZt1BKQOvqaOTkThQ+DmbQwj23WL
	 Tg826fZ+wlzTVIzfoEoa7RFaYXu2GiObNei5sYDVJvRjd3/tMlB4aX1o5YThBmvQ6cQT6
	 vhf09UIXi1joKNRlfL/ncMhHbAVkzZXIcGVGoyzMeS6dM9DWFGvZMzdD1qRNhtOjsHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bE85bbU6;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF132606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF132606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bE85bbU6
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37628596783so2080215eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395724; x=1795000524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbUKZdEyRLlv3O/aIgaEEkBaoJXsJfgjB065TzawuKc=;
        b=bE85bbU68xj/3eAUAW6ouagIHBXVoLbzfpQHIsteqgWl/ShOQJ73xaJE4beefIH/SB
         uqvgEORq9sFGFcMS6ndj8mC2gvSJZSDwEbkR5BrAvcMGU6H6zIHxXRZ8yzCOSl80tkjh
         krUOU8xkPtckSmqsg+8lGb5XeBS9c8fCxFwpLEFq2q21vWbKCNqJlYdHE3+tBzpIYEWj
         qZQCflxwALCqVqMRYZ+xgEI5g86/L/YP6Z4JJdFl5jbUtGMsM8RLbYpQHUPPwEsK1lqm
         RvAo5MRvQSvK/Y/CZIhkddSzmRYFShm/KObvzO4LeTwV8Ag4oyntxOa0ZPscuK443T9A
         ZTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395724; x=1795000524;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lbUKZdEyRLlv3O/aIgaEEkBaoJXsJfgjB065TzawuKc=;
        b=ZsbQHHSClPp04GueUzxY+AVYwT22enpsZoD4peEMlQbS+zbzDKVXPztCnN6aYLJOAH
         ynDCCS8axdv9oWEOeTSXRMTQj24FoMU/FR+3lUJq5WM+StL8zAN5TteNvLtULRjMenY5
         DcOdQlWYmifha3/hfh23SNw8DxO3tXX964wSikiRm2XXOeq+AX+B4+aQ0nQgiJk3FPd3
         QV13pa9Lg0s3vudpI2/ZEN+I/eQlXH8cxRoaqUT0+/UErMMvQkf6wORM95nCkL/56xHO
         4fjJ1R2GdZVlKj48eHW8l7PygsgTXLVe0QGkWjZdzX2obpL28hpYaPBC9x3ufX6NbSHy
         QhCQ==
X-Forwarded-Encrypted: i=1; AL+hErHueYlPSoOBIjyphpBCJ79y7ncYa9X4Mx07AN6FT05YAKtCyrfqxMYwKiP57BzqflRY4kSbw3PDPCAbx6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/GBPNTK4QDrdNVqXH+Zs2ZuviDTEPhcR1K5TqioZhB6NvFQhh
	66iIGP3aV0lRmTRXOGqRLoBmAr75OM/mZk87HqMQSgdf9EeCFRBaF0q2
X-Gm-Gg: AYBFou0kSbL2QUeozYIUB4UQCCPhPZDLRsJepTzwwrEuYYQYTgC8HfIra9D7Clr3Fck
	y8j/QuH9nae85uGWkP5sg2rZPhXI+QAdbxQCuv4FnlXB1sjAAJ0FFQMZ53fVBmkiaj2ZGbxyWbT
	I2n7fK0iOf/kl+PuvjglBX1/TKlB8o5Y8thgoFKJnTAsUS3zb2POgLsi2zvg1193O7c/URd81i3
	RItXe8KTDx1jcG4sA3XzTDjcKUa6khah5bZCGPw7V4KuDo71EuIzCLRD/kFQpnQcoo6c9lmkgb6
	QTOehHJ3pS9sgkV0Faivih60k3zlVPCw6E37n4pLSgYkwJovPPQo96c/YRSPZRqNyfNPduYjVYo
	XpLw2SIdu8d8t6JkVU3iOZKUVLyAb2jtMMWWDqw0iKYqrdnW9TotAiwd13/xm/gfAQ+7XHI1Jm5
	EF9p6yk3n6PIxqsj0aPM9dX/Tl5ZnjKvQgilI6l6juuXkSOtshCMSid39rJnUN6FK2YkDVWPIaE
	AnRTrPndV4LOWhZnCUWrqPbc/g4ionpsRbKHg1M71l57mUdunt09849K/AUmcO4KARCwO3BH/SU
	h9qQx1OCb47jZFe9kItjVzPKi+dXaW2IRI2cheTDazG7JjCZJfkx8TtBReX5GZsoOxZ3Ek0ohz6
	nDXvc12wuimhwnvc=
X-Received: by 2002:a05:7300:2324:b0:36f:350b:3838 with SMTP id 5a478bee46e88-37686278c55mr3634182eec.31.1794395723659;
        Wed, 11 Nov 2026 03:15:23 -0800 (PST)
Received: from manush ([2406:7400:94:5368:19d0:c01f:d33b:214b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm16577508eec.25.2026.11.11.03.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:15:23 -0800 (PST)
Message-ID: <6af44e4b.4b6e150d.9a2df.361b@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: sre@kernel.org, jay-hx@posteo.net
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: 11 Nov 2026 16:45:21 +0530
Subject: [PATCH] power: supply: rt5033_charger: fix extcon DT parsing and
 deferral handling
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In rt5033_charger_probe(), the driver attempts to parse the optio=
nal=0D=0A"richtek,usb-connector" phandle:=0D=0A=0D=0A1. When "ric=
htek,usb-connector" is absent from DT, of_parse_phandle()=0D=0A  =
 returns NULL. Currently, the driver unconditionally passes np_co=
nn=0D=0A   to of_get_parent(NULL), which returns NULL, and then c=
alls=0D=0A   extcon_find_edev_by_node(NULL). In extcon_find_edev_=
by_node(), passing=0D=0A   a NULL node can erroneously match any =
extcon device without a DT node=0D=0A   or return -EPROBE_DEFER, =
which is then masked as a DT warning while=0D=0A   leaving probe =
to succeed with an invalid/unintended configuration.=0D=0A2. If "=
richtek,usb-connector" is present in DT but the extcon provider=0D=0A=
   has not probed yet, extcon_find_edev_by_node() returns -EPROBE=
_DEFER.=0D=0A   The driver treats all errors identically with dev=
_warn() and returns 0,=0D=0A   silently abandoning extcon initial=
ization instead of deferring probe.=0D=0A   Consequently, cable d=
etection and OTG supply functionality remain=0D=0A   permanently =
disabled.=0D=0A=0D=0AFix this by:=0D=0A- Checking if np_conn is N=
ULL and skipping extcon setup cleanly if the=0D=0A  property is o=
mitted from DT.=0D=0A- Checking that np_edev is valid before call=
ing extcon_find_edev_by_node().=0D=0A- Propagating -EPROBE_DEFER =
via dev_err_probe() when the extcon device=0D=0A  is deferred.=0D=0A=
- Using dev_err_probe() for work and notifier registration failur=
es.=0D=0A=0D=0AFixes: 8242336dc8a8 ("power: supply: rt5033_charge=
r: Add cable detection and USB OTG supply")=0D=0ASigned-off-by: M=
anush Prajwal <manushprajwal555@gmail.com>=0D=0A---=0D=0A drivers=
/power/supply/rt5033_charger.c | 30 +++++++++++++++++++++------=0D=0A=
 1 file changed, 24 insertions(+), 6 deletions(-)=0D=0A=0D=0Adiff=
 --git a/drivers/power/supply/rt5033_charger.c b/drivers/power/su=
pply/rt5033_charger.c=0D=0Aindex e545a6e7f..5a149640a 100644=0D=0A=
--- a/drivers/power/supply/rt5033_charger.c=0D=0A+++ b/drivers/po=
wer/supply/rt5033_charger.c=0D=0A@@ -698,29 +698,41 @@ static int=
 rt5033_charger_probe(struct platform_device *pdev)=0D=0A 	 * is =
available, just emit a warning and leave the probe function.=0D=0A=
 	 */=0D=0A 	np_conn =3D of_parse_phandle(pdev->dev.of_node, "ric=
htek,usb-connector", 0);=0D=0A+	if (!np_conn) {=0D=0A+		dev_warn(=
charger->dev, "no extcon device found in device-tree\n");=0D=0A+	=
	goto out;=0D=0A+	}=0D=0A+=0D=0A 	np_edev =3D of_get_parent(np_co=
nn);=0D=0A+	of_node_put(np_conn);=0D=0A+	if (!np_edev) {=0D=0A+		=
dev_warn(charger->dev, "no extcon parent found in device-tree\n")=
;=0D=0A+		goto out;=0D=0A+	}=0D=0A+=0D=0A 	charger->edev =3D extc=
on_find_edev_by_node(np_edev);=0D=0A 	of_node_put(np_edev);=0D=0A=
-	of_node_put(np_conn);=0D=0A 	if (IS_ERR(charger->edev)) {=0D=0A=
+		ret =3D PTR_ERR(charger->edev);=0D=0A+		if (ret =3D=3D -EPROBE=
_DEFER)=0D=0A+			return dev_err_probe(charger->dev, ret,=0D=0A+		=
			     "failed to find extcon device\n");=0D=0A 		dev_warn(charg=
er->dev, "no extcon device found in device-tree\n");=0D=0A 		goto=
 out;=0D=0A 	}=0D=0A=0D=0A 	ret =3D devm_work_autocancel(charger-=
>dev, &charger->extcon_work,=0D=0A 				   rt5033_charger_extcon_w=
ork);=0D=0A-	if (ret) {=0D=0A-		dev_err(charger->dev, "failed to =
initialize extcon work\n");=0D=0A-		return ret;=0D=0A-	}=0D=0A+	i=
f (ret)=0D=0A+		return dev_err_probe(charger->dev, ret,=0D=0A+			=
	     "failed to initialize extcon work\n");=0D=0A=0D=0A 	charger=
->extcon_nb.notifier_call =3D rt5033_charger_extcon_notifier;=0D=0A=
 	ret =3D devm_extcon_register_notifier_all(charger->dev, charger=
->edev,=0D=0A 						&charger->extcon_nb);=0D=0A-	if (ret) {=0D=0A=
-		dev_err(charger->dev, "failed to register extcon notifier\n");=
=0D=0A-		return ret;=0D=0A-	}=0D=0A+	if (ret)=0D=0A+		return dev_=
err_probe(charger->dev, ret,=0D=0A+				     "failed to register e=
xtcon notifier\n");=0D=0A out:=0D=0A 	return 0;=0D=0A }=0D=0A-- =0D=0A=
2.46.2.windows.1

