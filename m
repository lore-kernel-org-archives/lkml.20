Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A93542F6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335562; cv=none; b=QLDLxy8wqjdKtkjg6cb/qKv1dDdSazFsGiPI14SPg0fgiFsiEyn81+Y5BY7AhdXbqYWijNXRDE/RHk2QqcQmaZP3bfuDslKFPPC5lNynzaI7Sc6t1CijjJTaRP5k1Aos6hxUgzQcwwVRVUFemwZFdvAA7Wa7z1ofRT/Yx8xUaPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335562; c=relaxed/simple;
	bh=vS/n6FpRvsfmcwxTkH9S/ll+Yj5BUUp5Nnnp42lgrTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVtSnEGunp4JuoGGj0yKefILjewI7Wng9CAoOLGlk4wxZ5zIjou7VfJuPOzflV8UJFUAdZbVoPgqrv36EePjY8bPLcXCD4bS2GgUUI3ZEBx4DA112ArK3D12V+YGRCY/ZQwnNLzae1G9OoOnR667qMmcOIQ3JftcVIn1WF7E9VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTy54Byw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGeolsm1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTy54Byw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGeolsm1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826WRae695460
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 07:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzl3ufzAnU4HEYD54uRhJuX7P8cpp0TpUhmprYF889o=; b=jTy54BywqPTSFTKc
	e10Qd5SSwa9PnvhTAt1zP1ZQkTHhlG6wPONubZB4v6pvi83tQIvJsJosNTTjsYd0
	mZmaeefAc6KB8nKYtcCVjsyQuZb7nP1/pNgulX5vZcBCc9HGvTso/tOIPAmd+kKF
	KW/tZPufHJACpn+wID9h/eKFaMhMfZDiZncxeBvA17kTOYD5l5EYjnpIbjlAudbW
	2dl5ORNL/ZG83GGhOqa4/5ZUbUjavBDF9xRu+cIlNhMlbyI60Ospx5C+IiALoiOI
	N7N5haY+5kg4ueqbph1lGUMAIGXCaE9SeBqiStfqpgP6pdnq0yOwLejysdLh32R5
	3b4FSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb5612ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:52:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso20029755ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788335556; x=1788940356; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzl3ufzAnU4HEYD54uRhJuX7P8cpp0TpUhmprYF889o=;
        b=GGeolsm1BCZ9IBJgiv+7sv8cHwR/Ij7ukEERws7/6nuQVotcbOoTUfbc4rAcBgRza8
         Uf9+sNZ28J81eOqisn1jCOQMbpbm3Rqc7ucPYuVevbDBfAYjZqx6DGSqXUJdDSEjzdlv
         9HJafe6jlo54IXGyWkQpe10AeatmHh4W8ljSKl7Ts32zgY8jsBhh9By0+x4dgQHjEodP
         E74k2qcrhOFL6SjJb4fOjkqPlJhR/pzoYN2N1mxYo0ZlKqv8K2hywXGPoY2VXcVmzhLH
         PnEcJek0Gpole1mdvBlJGf8BrnQHxG8MxNTTAjGsxK+mujoZj5P8XSy1MACNSDsJSGti
         gjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335556; x=1788940356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wzl3ufzAnU4HEYD54uRhJuX7P8cpp0TpUhmprYF889o=;
        b=VcliwBzgbX1UfkRFJlfTJ8eUUzX4CcjvR27qjvuiGBk7J/Os93/WA+Z/6qCd/kaeYk
         h8YAP2IsyfxwWKZUMbmgWsHJgpnKvg7qzLM1jw9CT/czyQuBSeUZEdU4qEBj8DN+5bTe
         gEANvktvNhKU74jH87ZhJEvCWwVKTldSiOHn7jp5noiiq1y05wOV5u3UoXx/5AUOERBh
         Aapt2J2HGyitUzCSQEtSZeJ7nlK/P6NvOp1N5vBGcfGO18A4sDL+SJrUbzCOHlF8xSdY
         8srJFxXOGwWIo8aSPXheMm18f/Umrqc1VXZvXpW4HDr2RqPo7aA5ma2Q+o05C9i5LgF3
         77nA==
X-Forwarded-Encrypted: i=1; AKwUvBxR1kF4t9N4y7ZDfUcsPWZQGW79+JyQOg/pJIoWpo3kVq480HMngb00tZpGRADUb1Qf8tFSZcOiMF4ux4k=@vger.kernel.org
X-Gm-Message-State: AFuF++kLeJYfY4A/kiwO3VFN+Ys3cRrpsb3oYTwPB01KNDz+sxKefUmQ
	j+u6jPymqG/Thpo5gDTw9jgYXIp5OXdF3T/MhbQEgOvvU/kYhkDwDohr/jhQq4B0VXKnPsll3iD
	oyxgzMLS/EZRzZLdhFG078kr5/eax9hRgYOzO3a9r0rzmD4IOfzMye6/B/ZDkVLiRyWI=
X-Gm-Gg: AYBFou01tNrYD26fXCGfyj5b6SX0vCc6L+D5RaVtTDoCvTBFuMOti0nP2r3xtC+jrVx
	YE++VQ57uPXrsFG5/vLEVqzr/jE9mNM4eZYIjmuK7mkSEbmZESCJulC3eeT0YaecU8K3UwuuUyH
	zS67vMNe9DcSGct70vyJxEAuIUQiu5Qdnxwd+yOR7QAJifq2CASKEIAVfKBlF9hp8Ar78eNrqh2
	QstQcdmcvF8xEvP1RYNmwjioFUD2tGTFLLbkr0AI9vYnhxQTHh7+VhUn3XROnDz1CiKtHuaWmEf
	KjBFVpA3q6FGY5sVrfZw7/OnxrL/TcWY3eAInQ5iTape2Rxxfjvh+P90FjT7A8bmzxi3vrd7GTB
	TH5Z8LUlImC6/Ku7GkT5ew2Girjms8YGYPTK1MVlzgHY=
X-Received: by 2002:a17:903:230b:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2daf13b31d8mr10641825ad.23.1788335556368;
        Wed, 02 Sep 2026 00:52:36 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2daf13b31d8mr10641525ad.23.1788335555939;
        Wed, 02 Sep 2026 00:52:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79898sm5004359eec.15.2026.09.02.00.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:52:35 -0700 (PDT)
Date: Wed, 2 Sep 2026 15:52:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
Message-ID: <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
 <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA2OSBTYWx0ZWRfXyT9aShchbCHI
 YKclIM3u9c5ghWbA0sTCg1zQEGsCrhWkj5OwUd2jrb0nYqr3ZkxDS+cDMxblSStZ69KsH2gsek2
 RcmvEAFavkoafSC2LkD/kz/0x6t6VV+FheR1fWhVlv8lkvQNMv72kU/LN7/rtPZiCutJbyXWlii
 Vk7F/0vV3XRiEwWSNFHuyh4T1gj0J5u1KJG9YEhWao0VA10IWL+l3XJ4R5TPwG3At9/VKqazAK5
 zUEhpiBibxhwo70FTF3Kk5jewQsF/DnNWIPbWDDrJuBZ7RBmbxi9Lr2xYEN1RdANxHBt9vyX/pj
 SVOXTdI8XCPkvW8C8QHh+eUbP1U7RkYcv5nQ0iHO/w/jCJ9rTpgjiDKOhC641ZOrAbNVeOBAr4Y
 eom2Z3qW9gUFazlVSJ3XR6GLsFjbHRZPNf0mDJ7IqIrV+FiOw8cZ9cqmuzYZL3dT3/w8dQjq42U
 +va1FPxgLhNXopByq5Q==
X-Proofpoint-GUID: UW7XuRmY4KVINrA5nsiX3iXTtDSIgwpw
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97d5c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aF_vd5NMXLjnXWj9f7cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: UW7XuRmY4KVINrA5nsiX3iXTtDSIgwpw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA2OSBTYWx0ZWRfX5UnER3qZhOlS
 HHIAhow5yD8QZ4zHV+wTGad/XTJ0Lgb+6YI8Qi+oyFpdMhy2F0RAkkRz9+c0zUB5KAot/puFPWx
 XGt5Qqqvgu3Vid3bqxfjCkWaUTME18M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020069

On Tue, Sep 01, 2026 at 05:46:09PM +0200, Ulf Hansson wrote:
> On Wed, Aug 26, 2026 at 3:55 PM Shawn Guo
> <shengchao.guo@oss.qualcomm.com> wrote:
> >
> > The Nord CDSP subsystems do not take their memory rail from the shared
> > MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> > resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> > power domain table.
> >
> > Changes for v2:
> > - Drop remoteproc changes since "mx" of remoteproc is just the name of
> >   memory rail input which can be wired up to NMXC power domain in DT
> > - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengchao.guo@oss.qualcomm.com/
> >
> > Anurag Pateriya (2):
> >   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
> >   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
> >
> >  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
> >  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
> >  2 files changed, 7 insertions(+)
> >
> 
> Applied for next, thanks!

Thank you, Ulf!

Could you maintain a immutable branch for qcom,rpmhpd.h patch? I have
dependant DTS patches planned, so an immutable branch would help Bjorn
to resolve the dependency.

Shawn
