Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCA751A14F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120380; cv=none; b=snv1OpEcFD7XVy0DaNk+dHrxE2VNAB++r0yw78ujN69kUpFhoMhNYkX+uUoasL011SQOGN+bXj7KAcFkmopjQy1uxrBlfKO1AohKbhnfcIVeRY8Aj0lz7XAo57V8YxPDVmi/aAFlvbccNzF/ddRAsgY48LdLL9eXsbYNMfW2MMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120380; c=relaxed/simple;
	bh=b4PyemOas51sLYTItG1LKlf5UMn0KctJVlyzgXvS4fk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=JW6BgVar97X23RgWlHmejtbHMxa/yBY2heIdj3ePMCQjeomoRrlZuDDDDnR3/H/L+ToTbZVwMk1sobE65lRKRGsHW4Cwy1fwZqTrlTcLBuuQ9F8Qs8whOR9WDYPQ6vbQo4UAol8MjFRC9oon3slWAgaVO1mH2E4A+aMIdSQukw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGTZ3u/k; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGTZ3u/k"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so1654955e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790120375; x=1790725175; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b4PyemOas51sLYTItG1LKlf5UMn0KctJVlyzgXvS4fk=;
        b=nGTZ3u/kWzZEqaIqg+axaFdnzXCJuW+PrSaAzT+4cTEknGMQsJCLDJswUVeF4vneU2
         OCNR5n3p4ybKz8SsSCLFH9Y7apg/H75Z6vi8sMhlEI4ulO45TLmN2LREXMfWQV6Jfxrl
         TAulGa8oSGX4hTgEsrnoEuvfK2h0HEoZG96cGEmC6HxonTbIKQQtxShKcCxd/S7UksNi
         y2qjltP1TzW7tTxobdyQYnkAmrDLLpB8PfE1lRe2OGkR3Mzs8xaPdFvZWoiTnQo/FF39
         UYh+JdFjfZIxInLB2dv513cvYG95H7rr5v5WpbMRMR00QetKZ+FQGhN2EvJhA0KxXVOC
         6Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790120375; x=1790725175;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4PyemOas51sLYTItG1LKlf5UMn0KctJVlyzgXvS4fk=;
        b=tEzbO6dJ8+hYV8dlkuwsa/PA94RWWvWZgfSWEd/D0hnP5kt3blxcj3PW0lOJuEmcD6
         lEiiwIWg2cj58Abqs3sXClWBkff3fFlCKwWz5MU8phkj0UJXSM01+Z2zF7Do4JefGHu0
         zxrTibNWZYTQPjEr+YdQya1Jr25zTS0x8kMPkDmZjWQjSHAXH3DggBCCdSJw9motF9Mu
         6UnR5W7wdWHIB/KUdrPjF5SqgstefBoAD6ODTjG78/kIbeUwZeZDYS0UpLvwzsiuaujd
         +neHpVbWVXFuLOBmQLZ4v8r4pABUkX4KwgVo1aqOFB7FyhMRHBtaq4BEdTCMJ8QxX0mk
         E7Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzAFKRI7OzMObBfuChAo/JjQv3Yo821y26c2VisGu3HOu55bkDpw6MjyEppu7dIbZm8HnD+K6GtSPAh9VI=@vger.kernel.org
X-Gm-Message-State: AFuF++nQFu/PdJBa3PPZpu60hljBnS6EzhUuvgB0UnzSrzmwXFsbipiz
	h7D/1sJ2M3UBA38Tc9uCjF5dXj24ZYkRJXv4ZL64PdTd+XujJACVc+Fn+25E59FeJ5g=
X-Gm-Gg: AYBFou15DG7a2UAD17ocgPE5dbyWbaRHa6j4ow9Yy4ssHfQCabSuboqs1w7R2TioUkj
	zK+TLdJZvrGYSHe3OdL79Rb1W03/Zk81jzzQSgUTK+uaeXezAMa3oMmdpYtzqXIRM4N+GhArCWZ
	YkiktglqKWXZkObcxdX/3DMirUWEUgcJkZHciP1V9xq434X1DcBYF+JczTay1GjLImFJ89yvTBf
	2YfRMi3IvED9iJGplsQ3Y+y4ZXXWiH+/tYQCqyC4a3EMcIihfyG51nd0D/bBegwXCZU+bUmNdrV
	EaydkEUoA2UVhRdfsXqPdAklWftnh38ofu6TQuBres9oNFaMQnIfnZUeCgdwNe0PaeWvw91y2dS
	Na6/5DxFBDI5yqU87tFSE1Rnctcc/SC46qle85nmpIbMpaticEwFIPKD+2s86RUwdK6HMztRnEk
	57vcVk6PfDmjNW69qOu2cqS3qP/yKiD+guUS9+eiM6kF7x4pE7EW7X7WFyZLzzhlfz+R+d1W40n
	B5CgU7J/jDrP2Bnyn4w0K72GlE5Y0AUI6D4iLoZVf+1lkZzxcOXAWX/QhdrAYwtTwyZew==
X-Received: by 2002:a05:600c:4f84:b0:49f:cbae:3414 with SMTP id 5b1f17b1804b1-49fdee0af33mr8327405e9.4.1790120375291;
        Tue, 22 Sep 2026 16:39:35 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1a0e00sm23315025e9.10.2026.09.22.16.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 16:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 00:39:34 +0100
Message-Id: <DLM8PMZGW3LZ.37Z3VI9NHG5D6@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <sboyd@kernel.org>
Cc: <dmitry.baryshkov@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <r.mereu@arduino.cc>, <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] arm64: defconfig: Enable configs for audio
 drivers on Arduino UnoQ
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <d7e64ce498db8aec475b8652563c6cd8bc8cd429.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d7e64ce498db8aec475b8652563c6cd8bc8cd429.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 22, 2026 at 11:11 PM BST, Srinivas Kandagatla wrote:
> Enable reset controller and pm4125 audio codec driver that are required
> to enable audio support on Arduino UnoQ board.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
