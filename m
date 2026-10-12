Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F83F1068
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813684; cv=none; b=mFrnH5SupF5jzEuYTtNZplY7M7wxykcc/BrFsO3TDxSora7Xkf58qsLAZWBqPXmbZUcVsdzsrdlYpImoVdI34dwqeNxE04egQp7y2GsdKqvs61z5UtAyxAp+QVx6jwXANaL5+ZMP7ti81O4JuVyIORxCLFf6MClqKNJodGZk3ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813684; c=relaxed/simple;
	bh=h9ZHlYBnFxfOVfJ6bovB1kxbNgqL2hLqC4HkxiAFUjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQbZvJK4Wdli1Q/K0WFWFrElMXJ6oKkviOZxpP8iDqn7PENtL4XC1TchYVfsCmRe0Wuy4I2+ck/OncnyU9eyoxCyGPgO4XrnpnJ9HU1CIKMiInojfa+AGMRX0G/g0B+vVJLtrHc04+pZCFiTgO9KLAuM483oMzR/ZuxQntkfMdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJc9wUbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOB38XBz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJc9wUbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOB38XBz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0RFE2088629
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=; b=FJc9wUbblKL6lkTo
	2aUKPxWhlauZR6Iz0thHESuvtQAiqgyV2cIqZDWwoXxzlfbVt7vH/3I90QXq2kAz
	fjkE/7gjaGiMOldclHWCw5/e/iH3yDpK8oRglBAKsWEa0VQgAFwNWeVHEuuY8Ehl
	8udZF3fpsSO6NgJqoQ9ZuvMFMGzjYPUojAfo345g23FLwQafAY7BYdDmARFpd+BC
	np5mInQLQz5yU99OhV6Jj7t4/pLf3OtHno6Xty511sA7BPKN5uZt0WAN2auyhlOe
	BmcyhU9bQ9LGpm5SlzhEFMR5z43f9L6Uapan9pt6xHKdxx8pFoSlXtaOIsK0jCFQ
	nz4hpA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu27m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:01:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c83124d530so3142555e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813679; x=1792418479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=;
        b=MOB38XBzkeig8R4BNQX8pXoVZL6tSp1zZVpbKXl/0P73PzXY0/M5+nF40jlUqm7cYz
         9aUQmOaO84ve8fBWCcgVZ9QKjgD09eF5a8abfpoA3gJvLxYuSj1mjBcOpGTwZ5ss26N0
         IXiyjnFZGkA9UFWGa9lkpUooTtzdxP10+8k6vVc1S4Bzgk6MGj0i6hwxa+mKrhP1AV9K
         ZSAcmPO+SNKaigVhTBSsMHrKfeHoT8i3M3mvNnQHMYGTPHlZwSL6gggGgQs6G+uVZl/3
         G1jOKP6HqHiLm6d1Z/JtBnbaQ3NnfiVM1v+0qIIEH2018wTzs7BhzDsif4Bp+ndxFZM/
         Ca4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813679; x=1792418479;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=;
        b=Npc392Fb568zIe18JEoRwUHOpOeDAs2DsEJXx/HI1RIB/StjdLzzyCKiFWbp0LlEM0
         dT6HWCm2GK3AVs39jJoJu3WCZ97tsFTIloz2GLsxLtn2gz5U/60Dqsq5uwqKrCp+KOmD
         sgA2+qKEHpAeRPFXwmqNLmu+wr6vjkyEgh8XGXbAkWo+D5NWJZQwoPD+rEHZuJSr4TnX
         QWMMWN7mhq9JQpssMQc/fHVBLkzg0OansBv9aPzDFMFuPVJgTN3CQragqVwsktsLkhcj
         DFNHqiGYLxr6fU/iAUbk/SpWO9D+mtK20fF3FBiMvqH8RH1x/EdVxruudQDCWfPIlFmF
         HBIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF0R0mZVnS9r3/peixCdN7eC830GbDXAVFWbQkn3aQXvU0oB8BWusQi1tfRqlCrvKkGy52H0AjAnlBYfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrvy6MbVUl18eGco+o5jguduiRdMcinqIN7gg88/xFUjsTkRiM
	w0GUkhLwAKOVD8DacwvCWqUrPln5QQeDh9wt8z5FC8EE56IY2bCE29wPMlqKdKfVxCJyrJ6PdiB
	soeeG0jSRfS7G6LtBnbgCaOLzgvhz/BxeH4DD8iXuy5NvlqqYhlOmz+SgPKtyJsXA7/w=
X-Gm-Gg: AYBFou3vq5I7/Qo17b076QweewR44Oj1HR1KhojxIM2f1mkLl92+nBQjKmhXrSBVqlK
	a61w5yIo1HrM1bGUXMp5WiDgx5W9+ViZxJGNZq9NgQ7qzTUvgELYrSlCzupJaKYK3HDrAffNn7E
	7Ym6+qYkET1AYuNDcmNg1fz8VBrvRvuQ1FZQ4g1ionzZKyLSurqTnlEjB44Ywm0zl1KPJDdRUAY
	XZUKk87KBtBHk2WrU4PJ62Wcn9W8Sn3OsdZmfe2vVfcUYzb3zuQ02VVXsI8QhWFMn+IWGbfmuak
	BO82ab5PuwXJLaVkoPO5PraE9RfBdjj0CVkzVVNONE4xWTNszUoFaeZfDQBI2GxYpKrjFOCk9lM
	eFCx+wDIyZ1PPIMD/DX7Gge3VMP8=
X-Received: by 2002:a05:6122:e14b:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5e91f483a33mr3001232e0c.12.1791813678336;
        Mon, 12 Oct 2026 07:01:18 -0700 (PDT)
X-Received: by 2002:a05:6122:e14b:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5e91f483a33mr3001028e0c.12.1791813675799;
        Mon, 12 Oct 2026 07:01:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd3aasm19101061f8f.32.2026.10.12.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:01:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Igor Velkov <iav@iav.lv>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rosen Penev <rosenp@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add the PCA9655E GPIO expander to Kobol Helios64
Date: Mon, 12 Oct 2026 16:01:12 +0200
Message-ID: <179181364592.7692.13657409498098359032.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yap2-tzRbe5PipKgXZOuP8YH1lMwI9M1
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acce82f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zK-fWJzOMMApgNEAF1kA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX73pMHtXaorrv
 CurGriuXGuIPAooZlvE4qiSlJMBHnZCx1/G8B0Abdl4SEPYU4uAmHR5W0RVUcQLL3ZtB/YNeDx1
 NoFlfJvv9JorlAUf+H1wK0oVjCABIS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX6jG5JlSPZD7w
 RsL2eZvFQD9Xtxtwoxp1iy6ZgvqQfGmzMCHN/4T88mTza8VcZjceBHR3caH2qZdMsoUrWZfY1K+
 DSe2KpJkiIqhYnmbYAYPBHCbzzjnB5wPwFKYANpj3JaVRPQa13faha03K0x61iJi83dJQoP6xG1
 yK5a4iUwxwfDwGDKJBrwOgxBHot6jHRLAyUawsuQUhUwrcYLPJER9sYDLJp+W/pn3vBoWiNSTlP
 nVfuXBaQ+Q52wo5JLXziri5hV6XyArMRVhNBag8iUZJu4K4XINRT75PTeIiyMjMgKEnYn91gLar
 yl1VcRMIfR6TDqbLO3vQ3nXAqVNJKJ8rJRdvyZ8ZtGIS8MnQbGeChH61EI3pcfGeL94cGIGkynn
 59YBP57hQyf6710iaSMobvl/m+GSDA==
X-Proofpoint-GUID: yap2-tzRbe5PipKgXZOuP8YH1lMwI9M1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610120055


On Fri, 09 Oct 2026 20:45:35 +0000, Igor Velkov wrote:
> On Rosen's binding v2 Krzysztof quoted the "onnn,pca9655",
> "nxp,pca9555" form [1]. This series documents that form and adds its
> first user, the expander on Kobol Helios64. Patch 1 is for the GPIO
> tree, patch 2 for the Rockchip tree; they only meet in dtbs_check.
> 
> 6dfda7947653 ("ARM: dts: marvell: armada-388: use onnn,pca9655
> compatible") in linux-next lists "onnn,pca9655" alone on Clearfog and
> Helios4; with this binding they would need the fallback as well.
> 
> [...]

I dropped the last sentence from the commit message and the Assisted-by tag
that's going away.

[1/2] dt-bindings: gpio: pca95xx: add onnn,pca9655 with nxp,pca9555 fallback
      https://git.kernel.org/brgl/c/356cab616b6f07a06c2d279fda8a9ec928fd5fff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
