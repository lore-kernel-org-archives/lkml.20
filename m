Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B323848CD63
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285136; cv=none; b=TlQSRdi7tsuBoKdSI+2fdZyViauvqHaXwNvDKZ9QlUMlFcVMx5YjtH6L0Nsqm7ufXjyOUhQjfJTBunEjcRG0BcEqs6Yg876CuLuW2ZjyTZDWey5MWjf86nb4u892DZbtiHZW2PrjEgaglquTGreIA/fDdGpHnOy8wEkd686TECE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285136; c=relaxed/simple;
	bh=5Ljoy05eM2hvOQIEt/wowa0X9gdsi6+0oEQN07gEYGc=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=TY/EYgfXNU1FcKt78uROg0VvNIg0Mw2fMc0yd8ArtgY/pOAICWSNqRssmW1qszZ/9FNF03MG/cN+db5f241u5kP5xKIFpQpnTGr+8EsNHhfBmmFKRD58Xt9b4eWgTfEjvrcqdkAsE5o/fbFEHzllm45PH89FfGuwGjK67UCFqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpFRfMy4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyAf6l0R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpFRfMy4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyAf6l0R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681HgGtK2623145
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 17:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGSjmkq62N7lfw1591YZQUCHweLAEMoRxMNz1OD8vjY=; b=SpFRfMy4AZW6zBae
	H5G8wTgDGfQCN0Kjn7+fOrBxF3d7RNIxQqrABEBiIlZERvV0UUTUCtDTDIH8H5TW
	8eR1nQK4jN3lj7bqHHi4uWh1O1n1tuijdyTtq+Ht7MlxZ6Zik+aNS5mQAz2+HbRg
	ACHZgk8RuPk8Rlg1qjGyG2C4oxyjHoJuv3vctogfEkVqhWWGg3CEpJ3GV4BtwtWT
	YrKf9FMHmVV0CUEtW25NXtOsF9A3PB2+3wNVwZ2zN1EPMGnRHhMmVJd7rPlmpZYD
	2JEaZFUYvtkQsYuOK7zzjAxqQ1upOv2T3rJZ7S6LEOVTYlJ37j542f+atvgxxjiu
	RKF3eA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k034r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:52:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfe48ca1efso909535ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788285133; x=1788889933; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGSjmkq62N7lfw1591YZQUCHweLAEMoRxMNz1OD8vjY=;
        b=GyAf6l0RiblIGLStJmH7k7px8YbaG8sJ9Nn3Bc+bwyrF43WW9BnBRaLvxtyPNjopwG
         x4yd3ePEaWoGa77QTe2UKjQdwHboxQkf9IzdQqFvUnuiWMhDJlRRa/HSpgciBGuIdtwP
         E9Y+C3+oyPvttLe3WJb5gl6fGtGYnCNCoeXz5c2bm2Fp3jeDbAzi817ljNhyl85/QLQ4
         nodLnK1kpiYfNkjriaLKBdIlWnn8J0mw4DbMbW/XZxqrGvXRj2WP9xYgkGsBeuB8xQNM
         PTOWiNj2MybaCvdW75zAAu289rR301eiPzPO2ETaA80idcqSuuRxB0uuN93HZULAyMAV
         cPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788285133; x=1788889933;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGSjmkq62N7lfw1591YZQUCHweLAEMoRxMNz1OD8vjY=;
        b=Hpaq6dmqbQTai2uNtX2/cXwU/kYxBy/7Hxr7CuuUIB+XB4APni8h8IUgYDHtzFN6pD
         0GidC7d7mAhKXJC6Tbne9jRLgAVwGoGzxXKCXFikdJZaUi9a9gtNDliifl8CRp5q8T/z
         Cnapz1kJGjqagFylbxwIE8f2BlmEg9wlmZ/NBY5yx5EidaQTGSXmHX09eDOA+dt+T41n
         mb5JTzpDSMRu3asPTsb2N0+V334cJGdX6riaeKqmLBxHuePjmXL8O6mZ1F51nLw8fzLP
         H9InIpBeALF64Yp1qHOLAleBJpVx6711WVdbpnrBObKc5vGs3Re+hFbZjk+RBh/xcqst
         HNzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtroGrJbBpcY259VLUM80JpdKbGN2KsrXw14kl7pkvRR8quZ8CxmtBKgnI/QVx1OEE6lDN8EnN1i34/Dg=@vger.kernel.org
X-Gm-Message-State: AFuF++kRIGkqVecaKJBzl+QLv49GP0OWGVfKO14P3kfXO0MNJfGRVs9F
	la4j2QAcDwJGmNpyJRLCw1Hlaw3UcSb1ozZJ2o5yLTQ1TlZJ9CvUW66jd4Ec531+PEwu+dwwmvv
	N/brNhnTsWq5WtwAZEvdr1x63hT2ntKw5seOeDn5RVXOcO9quHj0NIQcYYJYwjO64KT9UuTY2VR
	Q=
X-Gm-Gg: AYBFou2KTjmbCYKLXoTSEvzTduRH1YmXFqmmPmmMJLNvu0iLFZeaLzUVav6S6Sfkraf
	8v8bJ1XcXuC6Ykz+J8dWxeExWlJ+j+9ynwhxdTVH7iakm7RsuWMo5/qyP8Ve25s7ARBE58S3Btl
	oa1ldMXvhvsqCDGbZgN3liDgbPlBPv1166qV3Rg6URdssZn4aJYQoBLKlMWQrhhEaIykiXKoK+I
	JMTa3TG+kmlEhDOtkbVIeIJKvSryNWe9nxWdzc+W+0lYXmeKohDTjLTnH1d+1mYdL8v8HgmpCGT
	T7Rws6jzF1nX8s/vqrJeI2n3thNlSAaLfvBTVIndRSf8A6/sdc3DUht/nbb78+2ELStIWOhQXq4
	p/uh3NLOJBOwGpfxlCJ+9CPJfn4/oNrmoxYmuSXOeh6nXMlQaD/0tP8J3GJGT/yLyBukNisXhPE
	TXHCxm4mOc
X-Received: by 2002:a17:903:458f:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2dae5e17e23mr202885ad.6.1788285133083;
        Tue, 01 Sep 2026 10:52:13 -0700 (PDT)
X-Received: by 2002:a17:903:458f:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2dae5e17e23mr202475ad.6.1788285132633;
        Tue, 01 Sep 2026 10:52:12 -0700 (PDT)
Received: from QCOMk1gASIiYhG (66-33-8-210.colorado.intrepidfiber.us. [66.33.8.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784857sm38886128eec.3.2026.09.01.10.52.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 10:52:09 -0700 (PDT)
From: <subash.a.kasiviswanathan@oss.qualcomm.com>
To: "'Abdifatah Suruur'" <suruurism@gmail.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sean.tranchetti@oss.qualcomm.com>, <horms@kernel.org>,
        <stable@vger.kernel.org>
References: <20260901081441.632-1-suruurism@gmail.com>
In-Reply-To: <20260901081441.632-1-suruurism@gmail.com>
Subject: RE: [PATCH net v4] net: qualcomm: rmnet: require CAP_NET_ADMIN in the real device netns for config ops
Date: Tue, 1 Sep 2026 11:52:07 -0600
Message-ID: <001701dd3a3a$9c0f8580$d42e9080$@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGwzwKGUDaVs3KPTjfRVyDxc6JAIbcS1wVg
Content-Language: en-us
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE1OCBTYWx0ZWRfX+YYD6OJMHkaT
 FNnu+QFUZcVqFC4pkghs0IOdg/rrOo0HnjLZn0dBjqHqZyZoLYB6JwvPLA9XQyGDWwTT/+eM1NS
 nttNtigky7j6ckf61roRZuuA+0TAgiPhaBtB6rQxha2ZtCJD0ENwDR6owpn/F1t2+Cn744wDy3u
 QFcMeN2DR2lVyrHWoF1TiX60EjgcnS24OoDfOSTWPdPkH2rN/LuB41SZHilJtPjl7BfVXBeGBL6
 LbPN9ciH0qP4olqBV7MB3GZgTIEwNctrpp58PhNDpUExXQ9jFtjO8bFbGhiunkq6CLGlIHIQAPe
 KuW3KnmZpoWVjADs5WVRdgZVsIE1EJFINM04Kam2Dusa1HgoJ9rf1eVPxGV7ZoUZVELrx9DtfpH
 VA0ydxXA/MRD1ZtRgr+ShirH4ZV8YjU12rQh0asc0Mkgd2Z2k+Rs6rbtw6D12J0LruBGb/paZ7g
 EBz5tzTjI9cR0c+mHEQ==
X-Proofpoint-GUID: J8BP_iK5dGdiHZe7yuCf_MRVmcPBobNF
X-Proofpoint-ORIG-GUID: J8BP_iK5dGdiHZe7yuCf_MRVmcPBobNF
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a9710cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=OltkOWFNRHEXGe+8VJKHzA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cXkr8SbK9_hmXVLBwXUA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE1OCBTYWx0ZWRfX1qDrmAi8GTOp
 EDSX7+U95cebiKiwKk6IfAXZDInI1VtrSo+vSinJuZaUgVBRW7l5Gb6ouQq5yMkfRlhvjcr0HY7
 fKa1rT33s5ckm0trt+VnmTXjfSOQx2g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_05,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010158

> -----Original Message-----
> From: Abdifatah Suruur <suruurism@gmail.com>
> Sent: Tuesday, September 1, 2026 2:15 AM
> To: subash.a.kasiviswanathan@oss.qualcomm.com
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org;
> sean.tranchetti@oss.qualcomm.com; horms@kernel.org; Abdifatah Suruur
> <suruurism@gmail.com>; stable@vger.kernel.org
> Subject: [PATCH net v4] net: qualcomm: rmnet: require CAP_NET_ADMIN in
> the real device netns for config ops
> 
> An rmnet device may be created with its real device in a different netns
than
> the rmnet device itself (rmnet_newlink() resolves it in link_net), and the
rtnl
> config paths below only check CAP_NET_ADMIN against dev_net(dev), while
> mutating rmnet port state attached to the real device:
> 
> - rmnet_changelink() rewrites the endpoint mux table and
>   port->data_format and, via rmnet_vnd_update_dev_mtu(), can shrink the
>   MTU of the rmnet endpoint netdevs.
> - rmnet_add_bridge() and rmnet_del_bridge(), reachable via
>   ndo_add_slave/ndo_del_slave through RTM_SETLINK IFLA_MASTER, flip
>   port->rmnet_mode and port->bridge_ep on the real device's port; with
>   bridge_ep pointing at a caller-owned device, rmnet_rx_handler() then
>   forwards real-device ingress frames to it.
> 
> A caller privileged only in the rmnet device's netns can therefore rewrite
the
> shared cellular data-path state owned by another netns, and steer its
ingress
> traffic.
> 
> Gate all three with rtnl_dev_link_net_capable(), matching the "require
> CAP_NET_ADMIN in the device netns for changelink" series (vxlan/geneve,
> CVE-2026-68432).
> 
> Fixes: 2abb5792387e ("net: qualcomm: rmnet: Allow configuration updates
> to existing devices")
> Fixes: 60d58f971c1077 ("net: qualcomm: rmnet: Implement bridge mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
> ---
> v4:
> - use the netdev comment style, per Subash Abhinav Kasiviswanathan
> v3:
> - cover rmnet_add_bridge() and rmnet_del_bridge() with the same gate;
>   they mutate the same real-device port state via ndo_add_slave/
>   ndo_del_slave and have no capability check of their own
> - correct the impact wording: rmnet_vnd_update_dev_mtu() only reads
>   real_dev->mtu; the MTU store lands on the rmnet endpoint netdevs via
>   rmnet_vnd_change_mtu(), not on the real device
> v2:
> - drop Reported-by: (implied for the author), per Jakub Kicinski
> ---
>  .../ethernet/qualcomm/rmnet/rmnet_config.c    | 27
> ++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> index 78d4df55740a1..73bd5419cb136 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> @@ -312,6 +312,13 @@ static int rmnet_changelink(struct net_device *dev,
> struct nlattr *tb[],
>  	if (!rmnet_is_real_dev_registered(real_dev))
>  		return -ENODEV;
> 
> +	/* The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
> +	 * but the port state mutated below is attached to real_dev, which
> +	 * may live in a different netns.
> +	 */
> +	if (!rtnl_dev_link_net_capable(dev, dev_net(real_dev)))
> +		return -EPERM;
> +
>  	port = rmnet_get_port_rtnl(real_dev);
> 
>  	if (data[IFLA_RMNET_MUX_ID]) {
> @@ -440,6 +447,13 @@ int rmnet_add_bridge(struct net_device
> *rmnet_dev,
>  	struct rmnet_port *port, *slave_port;
>  	int err;
> 
> +	/* The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
> +	 * but the port state mutated below is attached to real_dev, which
> +	 * may live in a different netns.
> +	 */
> +	if (!rtnl_dev_link_net_capable(rmnet_dev, dev_net(real_dev)))
> +		return -EPERM;
> +
>  	port = rmnet_get_port_rtnl(real_dev);
> 
>  	/* If there is more than one rmnet dev attached, its probably being
> @@ -488,7 +502,18 @@ int rmnet_add_bridge(struct net_device
> *rmnet_dev,  int rmnet_del_bridge(struct net_device *rmnet_dev,
>  		     struct net_device *slave_dev)
>  {
> -	struct rmnet_port *port = rmnet_get_port_rtnl(slave_dev);
> +	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
> +	struct net_device *real_dev = priv->real_dev;
> +	struct rmnet_port *port;
> +
> +	/* The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
> +	 * but rmnet_unregister_bridge() below clears the bridge state of
> +	 * the real device's port, which may live in a different netns.
> +	 */
> +	if (!rtnl_dev_link_net_capable(rmnet_dev, dev_net(real_dev)))
> +		return -EPERM;
> +
> +	port = rmnet_get_port_rtnl(slave_dev);
> 
>  	rmnet_unregister_bridge(port);
> 
> --
> 2.53.0

Reviewed-by: Subash Abhinov Kasiviswanathan
<subash.a.kasiviswanathan@oss.qualcomm.com>

