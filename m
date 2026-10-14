Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26EA48550E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021605; cv=none; b=mrhZTRLrXmkLD5JUWfBn48EaH1ZyAZvHp6tY0MyRdgMUDGott+RcrlVtpvkZoy6gk6aFAN8ZxBAkN9pxu5hCKUSoHtqONRf6YFVV7ji/7JKVcYfmyxrtL+KSSTIQK2NgQVfRZCFsXdp1XaQTbfvs9tLhuQbgpnxA6qlJjVNUONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021605; c=relaxed/simple;
	bh=PD4O8NeXrpVFSdk6A1M/yZB7EiBrEVY5GZoYdPfOTBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTt8+42wu0893cBiTM/GtSY0JkFYN9biiOQrt2eqEteZHZYxNjoDss/93mizj363ggD01hyeS4rxRzTRppmjNkI9DvtyBGDdGPQfAH+cn6uyw2gRA1ii6sREIKhZvh2vzq9bfgMMShkT6pmPFzL3A2jh4jCc4jO6uxqZik5Euyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxiEO0Cr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8Qo3Ien; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxiEO0Cr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8Qo3Ien"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ELwRva500307
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGsSHjvhagPRXiAvKSbTu3/S
	aEhQGd0uTphQRGhmwdI=; b=JxiEO0CryCiXsww03jKFnqlfHqxReTyDdp5kUXLv
	QULPpT3bTqj+lWLIHihri1ovAEzk4GyRNwUyYc/O1WY/L399eRXvkjwpN9Ee8tVu
	nhgkYjZjLiTdRDYUVYMLrSBTFDhmOGT3/Y28aeetbLENcyaTTlVKEuXjH7X/WcEj
	K2IOA8BZL0305lUDw7JTpuHTaDg91pAaoVRygueHQaxER3u2nvoE/fUO4GW53Gss
	j6cJAhqRwH7uSPC6qXxRXstO7FEHXCa34JNB7E20gEeMmSBsyrG7ZttvWpI2iU49
	/nvUSTC4mSVM0y+b4hcbwVhZsv2IkP0fgS2FvCf5K0Xh6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf28b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:46:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc40759b2so1018480685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021603; x=1792626403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=L8Qo3IentWa3J7h0S5kyDB7gScSm+sRcrPvMJLHG2OgJyE2R/5lDfqYWzeoIAWYFJG
         K1kbpeOSYdAfUJ0Verj5BY3LQbbREHLdRJW5qHrcFaUAx5nqjkJtlnqZ+2DRn4mYpK5N
         UOnG618yOnVOvYNIZSMwEM7tlqxfXL0NHg4z+QAzkGp9sqv+BGsQ25TS/0iaumUcaZOA
         Md7bDvvguuEWrW7lKslNFiQ1Lo6hLTTn5EfSIBVsm5B6lZCcm/UA7G0nrL65RT8rC7sD
         GSR8h0k6lqjYrArBfmyrWWK3sUunG0FMXBf/TS+qDDWv6NPBZZbS8eJgMAsTInqq5Gty
         hfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021603; x=1792626403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=bFXVEkUTl6tbi946ejG3ekRyO5Tcd1ttjPYofRI6UUKtJa6OGLIifn1UABl/mSSdQT
         zsgTCzTs2NEEcFsWEWfK8DgweRY/MRdIdbOCaiItfeT7wyq4avdmLT1425gib+VS24Ns
         mDTdjqRc8WtooQXJQrjeIvqyAaFbtcihE3xHCbcKA681H8GmwYmAayxHnUmYi/ns5hZf
         C75HFie9yah3j28zY5z4nIQaT20eBse3INv4mR2Lvzs3+PdKOBLSHjwNYLsEn/CARX7c
         AF2GtfiOo1UMOjCyq7Za7sCSe039tVbLq8TJC0fiFOEz5fVbHXo+kSB0HwR55I1fY08Z
         rSPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPECfiNH1pgpkIlnZd++DjhoQeQVt3OdBW6qrynGlbki4t/tUyyEBwWTKFI0vEUTRlFzeFFjVFzJ/5WOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1E3p4WrD0ZKa+IUO5u75jxURfB3dQ47o2gUX/TpgxgeQe+UId
	GZDUu8GjAeEIJqITR2ett3Uyy7MJwqHJCJuFY1jLkKNMUu1Kdz5eyOylF6U0bJ4XdyYjNpSwEnr
	aUcaJO8sKruvBezyznKzZ6eKwoSyS3uAP/91TvUoZyi4TrK0/BD5f0kpw+vIUgddG/Yw=
X-Gm-Gg: AYBFou21sH2U9ylpxZdWBbPG7gAkyvk0FJ+Hg9igyUGFeeKZQleTHSUEEOCEu9pXhaU
	LM3xptSpaNTuldG0GN4ruUl544Pg+H9TD9XVC+iomuU4li2EID0kwgO214ipmUIP8PQCqiXKdWn
	aw4SRYV15FnKXxPkP6zPr0+tEbySOGe1Y5QnLewEjyMN6pikrTFcb4wFbaF0EIT4InujylRQ0Pk
	v6bJAJHj+MUsHVsu3eymN8BTEu/pIWR6OOA09y/1TeVoXx/tZaNxDDUZFixHrrMMMWQYf0NWHQy
	IGlHtDaUswgG3IYRBe3jzif83SNFmJfb0V8Xg1+nr9b8E9eRRS7eXi6rpMXH1BxJXN72qzMLrYy
	pnYV2Mjk+7t0pjtaxaVSQ5n8Sp3Fh9bhqzI5U2xJaZcmZf0DH9d/JjXwvjWiPF9wD6kWALnUBpE
	dfgP+lbAdRJ2+R
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871711785a.2.1792021602941;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871707385a.2.1792021602398;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93e00sm939809e87.66.2026.10.14.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:40 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Use DP AltMode defines
Message-ID: <qgkw2qvqwmchclsdf3k5omanjd7qvm6wyxfjy7bb66w4koarnz@6s5k35dmqvai>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX+lP2ocDap/VV
 HQJJTG3+Ugbdr21bwT/iFtGfGMtW7Z/snw3CG0mHr3M6JHP/yfSqks0vnlheVOLAYiSKOiBKXyr
 Tt7bCgNtQj90GSMYizoTMTvtz9NriXhkOz9wpOX1atI0lS8iSzKtMEdMYmROmA0MfDG7OlcwdjA
 klGmk11OFddTWe6/vq4tOcWeLnIEaAaMqOIp4eg89F7/5HZkPfpHvESPuIW0xX5ejHMMj2dC0p7
 eFVtJnQ5jHDD/reRToTVlTSVaU6EkopIXNuU3emAGUQWM0a86xpXmWuXbnv8dn6NzOfox58ZkJN
 AiHOycwUcjd+N65OW52jul0cR2xp+Jzph/H+EzR+JWO/R4Ed5U1+QaBIc00pY3xBmwQlbNF5NCr
 z+CGt7SVPC5G40EXr5ij/ELluxQl7TcbWJioMK1nd/tKYCYHQ5fvVQVT3bClKpYf5F5yGLO2aS7
 0oEwVQDf6ytWiECrTGw==
X-Proofpoint-GUID: LOu2hH9kr0tWDcju3so0nH6Ie4b6vVju
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX/xTpbnCr8xPx
 ewVc7H/ZQrBS4EmL2rH01qELfwVSRcT7M/cPoqumPBpTyrLj654G2du5otCE32Y40DMCW4zY7oK
 py3KO21ZjvWKME64CjJ3CycOCgTONQg=
X-Proofpoint-ORIG-GUID: LOu2hH9kr0tWDcju3so0nH6Ie4b6vVju
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad01463 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=oov9_tbh0Q946gG9V5gA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:50PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
>  5 files changed, 30 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
