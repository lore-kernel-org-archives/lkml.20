Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394974;
	b=B5LHF6v3fr4ES4L76+qg0Eu+M4VOUEV/9L76MWW4PqFtI7U8epLsSzEOl8S1lnhD49TV
	 7aCRU4kKMYlkXdKB+0/Xm9LeKrlfkuIs6H0AjW4qVPlzMH9lvHcDOZI8t+5wlmDGxYriF
	 2/mIaOgHLPKge1dOcO5PJd2vgFq7JhgUiOCWuHOCuSyVN2KrErHMqR+sFXZOCg6TPyfcZ
	 NEkcR5kP1P/F9/ENnNIPxBY1fSXiwRo8lp9psW0wNNra+a5EDXa7k/y2SLnhnbub1gqm3
	 xBFRwToMhbkVuMR2x1eubjRlczekELPXYhyC/G2utHryh+0HFxjiXyq3oyFh0zamyvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Mailer:MIME-Version:From:To:Cc:Date:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
	b=KILKNPD6dZCq21/jbCpKrSB/KzMJn7CiHE0Drc7TbMiO6W9lYGCeJZWWkG9xuuCzibL3
	 DB+3K/6PTasJbVeG5+NTUzgxMxq9R5anD856uSAXMX9FrtKUBJ2RRo2afN2PljoE31gKg
	 oupEgee3fTrLd3oL4WKr8rqr69kQedRSPtMjdKHJg+xPPY2x5a8HOG0WT7XiHLIcGN1yW
	 N1oNS/H7Mf+paXqemSoIEtYYnv3tm0GsWrzr2TxtdL12CkQdA2zTm9tNlQu1RUJXq1fu/
	 UE4CADi2M5E5ZGfxlrOurTOLBYoABJOJvxpjnC7Gc3T3mG1Q5xLzMQ8GpbY/I5fUeag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/J7sxDT";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A090D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A090D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/J7sxDT
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37600b0db49so1158017eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394973; x=1794999773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
        b=L/J7sxDT/XCJufsPd4aEDhSnaTLlDVWoiL529BZDSumU/aQ/mYA3iXEkNrpXVwPBoU
         q50f97GVB0vrlQkxz+YQ3McVBXk6IUksdPIimKZVW3fbiVQmmJCxzwvMavzaQ82tjaQa
         pdHG373MMWyh2wHSfUN9lJU3hWzM2BJUFG4Jd07p42866K55AYB/qdE/m3Hcye8CZ2dr
         3CWbGnOzR9Kv/vfIVVuW5wqJrVkeXOYFDMr/ZcAOyQKBW73W4vdLW8rIZhlLRfilr4DM
         OcyiCfJjfMgALs2pSDPWTCnawgN9aUugAx1doh53H0aliWkfvx2E0m/9O8Y+w3WEVUSQ
         KlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394973; x=1794999773;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
        b=fqTYUfOtyyoZcLElsBHdon5GJasu5t1Trl83M9JPbj0N8+adWCr/XA4el3z1mnlfDp
         pMG79AuyaFGHmzyWQvexuokxdmjD8sRQw/2O4xE6ZmUpKSvuFrmSG3LwFGMYSTj6mBDv
         L/n3dAixIDL5B7TD1nvxv3DWo+28t/RoC6iE0E7/PU1LZJ+5fk3flZPbfNxkgs7NSOBo
         1bgCyxQUtnpJD00+BmTnkbExwo7ZIys+adj7VNwYrBc7J2UwFeHIeeFeixLU1nTD+CBe
         vJs6wVOQwmr3XLYIvHTir/6uLv+gi6sWiao+U4cjCNr8B91GAnRuk595vQagxmHTrVMh
         loXQ==
X-Forwarded-Encrypted: i=1; AL+hErGHp6Ka3ODNEqHBtFL+5aXVNA+fZ9zUW2mR9rH470Y1Le8EawmLPcmMIG/v0wqbpoY+vXnKK8Z5nz98L+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WYno4HhWVITmwBkIVKthUnh08+TlEGNU13mGoVSv1zg/QvGjx
	+Xt6kSMCdsL5WNedHV5aHZjTbFGuhVPjJ6D+2HMaa7KbQuUje7S21a66
X-Gm-Gg: AYBFou3R1NN4EDT3jYJw8YjbcitQSGlNFd0w5UiSkgbIAydatlTfwkLZoJxj8PpqSuh
	Yc5BlDyxaIu5UZdJz64IjTwkP+sRViTppFo7B4amg3TojsDbXGA0neIt8IrWo6hjfGYhLGWY0iV
	UZroVRcQR5KmzHXYWoN/QH5zeP9XZLXcZR66nsuI0DNY8CCUuXQsHwy9jAI5K1XLBbzQzbFsCq/
	9kG71RPRGc/BAobh99pSOArqf3lznVZCU9SbaLF+HeMWd0HZJI8Um4s9IAzWP1gKRvqIFKhgRbi
	kSI4L+Q+FDJ4I0yVTH60gR/0jvUeL5ECekwCFJNauVzZNrUjxz5yY71AFHndfkPf++jw9hippZA
	s7kPAP30JfLK2BNIrXnaCbMg2WeExjuaQ/u4ZpLzpUVLOQFSz8pdta5IrQmVtLBXZIkAGvbyw16
	Q+iqugmwsQ2oXTX5dsl2yqa1zMQSOCr2TvT3NgtssKxVEbbDcuMR8p5D04t2cWFcljuuwHWgKN/
	bHsNE9LXr/ypndLx7LFotx8uYnvVYTr5rvjMXsjBMgxiftHCsok0/IYkv/IQ2OBpnEVPy7K7RMD
	E+JAwBvTH9jD9LI5RPOlk2Hvp4rhi6/NH1+vsF+vcuCFcpBmEUmNV3tUuSLXihqN/aAPY5Vi58M
	Xv4eZaerV+H5xHvkHU6V6xrQFYsbGVpLXOA7b
X-Received: by 2002:a05:7301:e22:b0:36a:37:1404 with SMTP id 5a478bee46e88-37686d2fcd4mr3499154eec.13.1794394972545;
        Wed, 11 Nov 2026 03:02:52 -0800 (PST)
Received: from manush ([2406:7400:94:5368:19d0:c01f:d33b:214b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm30729052eec.23.2026.11.11.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:02:52 -0800 (PST)
Message-ID: <6af44b5c.67914289.fe7ab.6559@mx.google.com>
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
To: abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
 mturquette@baylibre.com
Cc: s.hauer@pengutronix.de, Frank.Li@nxp.com, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: 11 Nov 2026 16:32:50 +0530
Subject: [PATCH] clk: imx: clk-imx95-blk-ctl: fix error unwinding in probe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In imx95_bc_probe(), bc->clk_apb is enabled via clk_prepare_enabl=
e().=0D=0AHowever, if subsequent operations fail:=0D=0A1. When !b=
c->pdata, devm_of_platform_populate() failure returns directly=0D=0A=
   without disabling bc->clk_apb.=0D=0A2. When clk_hw_data alloca=
tion fails, probe returns -ENOMEM directly=0D=0A   without disabl=
ing bc->clk_apb.=0D=0A3. The return values of devm_pm_runtime_ena=
ble() and=0D=0A   pm_runtime_resume_and_get() are ignored, potent=
ially proceeding with=0D=0A   an unresumed device or invalid runt=
ime PM state.=0D=0A4. If clock registration, of_clk_add_hw_provid=
er(), or child=0D=0A   devm_of_platform_populate() fails, executi=
on jumps to cleanup:,=0D=0A   which unregisters registered clocks=
 but fails to drop the runtime PM=0D=0A   reference acquired by p=
m_runtime_resume_and_get() and fails to call=0D=0A   clk_disable_=
unprepare(bc->clk_apb).=0D=0A=0D=0AFix these issues by:=0D=0A- Ha=
ndling devm_of_platform_populate() failure on !bc->pdata by jumpi=
ng=0D=0A  to err_clk_disable.=0D=0A- Jumping to err_clk_disable i=
f clk_hw_data allocation fails.=0D=0A- Checking the return values=
 of devm_pm_runtime_enable() and=0D=0A  pm_runtime_resume_and_get=
() and jumping to err_clk_disable on error.=0D=0A- Calling pm_run=
time_put_sync() in cleanup: if runtime PM is enabled.=0D=0A- Addi=
ng err_clk_disable to call clk_disable_unprepare(bc->clk_apb).=0D=0A=
=0D=0AFixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driv=
er")=0D=0AFixes: b08217a25721 ("clk: imx95-blk-ctl: Fix synchrono=
us abort")=0D=0ASigned-off-by: Manush Prajwal <manushprajwal555@g=
mail.com>=0D=0A---=0D=0A drivers/clk/imx/clk-imx95-blk-ctl.c | 30=
 +++++++++++++++++++++++------=0D=0A 1 file changed, 24 insertion=
s(+), 6 deletions(-)=0D=0A=0D=0Adiff --git a/drivers/clk/imx/clk-=
imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c=0D=0Aindex =
bc6957299..ad386a48e 100644=0D=0A--- a/drivers/clk/imx/clk-imx95-=
blk-ctl.c=0D=0A+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c=0D=0A@@ =
-394,17 +394,29 @@ static int imx95_bc_probe(struct platform_devi=
ce *pdev)=0D=0A 	}=0D=0A=0D=0A 	bc->pdata =3D of_device_get_match=
_data(dev);=0D=0A-	if (!bc->pdata)=0D=0A-		return devm_of_platfor=
m_populate(dev);=0D=0A+	if (!bc->pdata) {=0D=0A+		ret =3D devm_of=
_platform_populate(dev);=0D=0A+		if (ret)=0D=0A+			goto err_clk_d=
isable;=0D=0A+=0D=0A+		return 0;=0D=0A+	}=0D=0A=0D=0A 	clk_hw_dat=
a =3D devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc->pdata->=
num_clks),=0D=0A 				   GFP_KERNEL);=0D=0A-	if (!clk_hw_data)=0D=0A=
-		return -ENOMEM;=0D=0A+	if (!clk_hw_data) {=0D=0A+		ret =3D -EN=
OMEM;=0D=0A+		goto err_clk_disable;=0D=0A+	}=0D=0A=0D=0A 	if (bc-=
>pdata->rpm_enabled) {=0D=0A-		devm_pm_runtime_enable(&pdev->dev)=
;=0D=0A-		pm_runtime_resume_and_get(&pdev->dev);=0D=0A+		ret =3D =
devm_pm_runtime_enable(&pdev->dev);=0D=0A+		if (ret)=0D=0A+			got=
o err_clk_disable;=0D=0A+=0D=0A+		ret =3D pm_runtime_resume_and_g=
et(&pdev->dev);=0D=0A+		if (ret)=0D=0A+			goto err_clk_disable;=0D=0A=
 	}=0D=0A=0D=0A 	clk_hw_data->num =3D bc->pdata->num_clks;=0D=0A@=
@ -462,6 +474,12 @@ static int imx95_bc_probe(struct platform_dev=
ice *pdev)=0D=0A 		clk_hw_unregister(hws[i]);=0D=0A 	}=0D=0A=0D=0A=
+	if (pm_runtime_enabled(bc->dev))=0D=0A+		pm_runtime_put_sync(&p=
dev->dev);=0D=0A+=0D=0A+err_clk_disable:=0D=0A+	clk_disable_unpre=
pare(bc->clk_apb);=0D=0A+=0D=0A 	return ret;=0D=0A }=0D=0A=0D=0A-=
- =0D=0A2.46.2.windows.1

