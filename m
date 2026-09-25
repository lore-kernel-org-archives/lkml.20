Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287504C9DFE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354487; cv=none; b=BsaoVNWUzIDamCNyW+LERnrUfLJfnSP6miRmYeX+H8hwMf+7qPYO3a2eI6cnHfHV6QbXQplkab2yCKROFFzKVodWEascUW4LaQ5Mc3mcHPTp1pCfSABk5OxjnjvVAltQbzHQogSArg6U1rmojzEV0uUID0RmUg9Hs2H19nCFvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354487; c=relaxed/simple;
	bh=6Gd4vf7bpYvevr/XoLpiMssWOSifiMZ6CNt4MPZA9zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GO34eRdF/9KOxeDUujKQL1s2Detwj7b41YjMtAZctY/cFf0MnZ+E02xrxwYuIRWTchacKYxyR5cdZrbdqzWyzZ0jdJnca5ikhU35G4REyHtdfRzbZ6/SbCHdqKrms8baJ3sd7ugAAicyOl/btCcKPgvnl0Nn6kPX1p1IQZ+I3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=ZPVmwzjP; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="ZPVmwzjP"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ca5aa7so108637585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790354477; x=1790959277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Gd4vf7bpYvevr/XoLpiMssWOSifiMZ6CNt4MPZA9zs=;
        b=ZPVmwzjPCgFbxehdiQntsj2eCKJdbl//1zWkim3xVQsVZOn5eDTac12e3DfVhKSN8C
         rXI5U6hA29+CHnX4aqdYM+3aaitlnPh3WzWcE855XhjykP8iUb0lM5WtLLZclmY3aXGs
         Y9Eunv5JcmbFTQq7aInRAaoRsy+1eJlWW3aL+/63mSeBVqZg00Cq3bbtgtMcph8ZPA95
         Sd7gkHrZPF4jczy16gYAkhfGa/GOVm21WbVAdaAe8IdnTnlo150FgnidXPcNWfQKWZrB
         1zlPXsh9HSnabZI2CleXw0tk5TgdVgTM2D1CDRFLR9L5FQnBV/fD7i3p71BTaOFMu247
         5CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354477; x=1790959277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Gd4vf7bpYvevr/XoLpiMssWOSifiMZ6CNt4MPZA9zs=;
        b=gE89YdL6tXHRGmtzwF3EDHsLZJ1fbkht52L/rxis/T593eE+HFNHdeWA/xFkjfccHH
         B/trBBusKxsy/PfiPDEhgVo0YSgzAFBvz1cXQ+PG9xwTpKn8/kkRlxASFacJWssNIbnP
         xUmL8RQzWjtoRU/JB/Yu+XzKpngpCanGc5VfSlU/sFeaNxWCH5HzD9FDhHdIZm4Z479v
         Z2Yn6dpJhwWjzpcnMCpFXyT+cZKQhKBay/CKS7cR7LqtQy2RizlI5PS0cveXWnk8Lrnv
         XkvtU/lLdfUhdkSHS3geoZ8hSM4cr/MqSAwPqyaMzMLy3PRKOQoLl+gQ1KeuG6cpPTjJ
         U/Ug==
X-Forwarded-Encrypted: i=1; AKwUvBwfoTNhf+FlKSsdHhnBXxLpxDyr+VzyEg+TOV2yjXD+9vtuCrIzGJz67eB6wks/WfHRxQ9VASmM0XekPU8=@vger.kernel.org
X-Gm-Message-State: AFuF++nrIMlsqDL5e/QEJSrauiwrPla8ZYAvE86ulh8azcpjAES/ueVp
	L1U+RkrqpGLs05TRvjHFtwKaTLWUiI2EDZdppBL2fb1nVPOpwPE6mRiNtS0pOzzQ9mI=
X-Gm-Gg: AYBFou0TT8QGlRNb/HB5NltZi5YywUcSXLn0JtDZru2gFsO2lCbkHoxTRgck+AIHVMN
	w8dAXB4mO4E6QfKHkHN5tA46nWaLSsgKukvGueC0a/Fv3Eyr9GWEhQsC1aAu4MF8TtAMmhO62gZ
	s5gr/VD6Zpm9i5wgj6nnECXKwjyqZXBDViCwxz+9IO7um9TkfPs3NecvUbwiVo+NQkhg2oBSyHB
	Wgzk+c/psofbvDgERb69DnOpAWblQ3JgLekJlGQgHoQNIwuscWOIJ+g92S5WFk6mCmj2WyhvsZL
	N9KGZaxQYTQ37W4q70AaEGMgUzH6mjj5vpBzOttmLGD4+HwpP/EOrE2kGuLo3gaJEvT12uDKhvP
	y8ZAr66CDHI1JAyMxyUZGAJRzEOC9V8vF23DoWMF0IKU1Qh7ebPoLFQsAJjxupcE3nteEc2ypjx
	kBe9a29+IZYNeTyFcuROQtM6kum9pYdsB8i8ucuu2v1aNx9XPAFTe8ylqOyA==
X-Received: by 2002:a05:620a:414a:b0:939:9b1c:ea4c with SMTP id af79cd13be357-93c43bc93b2mr592149085a.28.1790354477368;
        Fri, 25 Sep 2026 09:41:17 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448ae8ecsm217064385a.9.2026.09.25.09.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:41:17 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API devices
Date: Fri, 25 Sep 2026 12:40:54 -0400
Message-ID: <20260925164054.25831-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 14:56:40 +0100, Bryan O'Donoghue wrote:
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.

Tested on a Dell XPS 13 9345 (X1E80100, OV02C10 on CSIPHY4, two
lanes), with this series, the CSI2 PHY driver v18 and patches 1-4 of
the x1e camera DT v7, on 7.2.6, plus a board DT for the 9345 (to be
posted). CAMSS picks up CSIPHY4 through the PHY API, and the sensor
streams at 30 fps through libcamera's software ISP and into a browser.

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
