Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F51345D5E7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789590644; cv=none; b=VQoqSEJtlNbPygiDtTPkNIzVrSCBRK/T1kKfKlAsSROKlE2lgGmltekf3ic2jQMgdy/nwkZ6010nVYW2FaIx0jpw33C9TE+VSKl4Hw/GViQKkvC2rM0BtkI7jlWh4puYiIwTmETH86YQUR1my5nBnualeFyxSfy8J5C6mrsBSgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789590644; c=relaxed/simple;
	bh=JAKUUqJd2qHCPRvww3fZ2YL79BWIF2sO/qrKX5j4WIE=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=DlAsxPKOVWiPCgz/J3SkeMQ4ZUOER+lUQs117n/6OH03klhQVMjhVs/kYZBAiREuVPBh0RVebihn0k+dolp0/Iep3zo1lp6FAba9O3t3ye2taCuOKvDZG2xpn0pk9Q4rG8xwA7zJhApGAzjdZoJUBKhEVfNlYGeT1al7Ew4UpjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVsQOyjJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clmnN0yc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVsQOyjJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clmnN0yc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeHYb3107233
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PLBICahvbn3jQdn0qzJ9oGFNdxzqRaRW4Cw/G+Dtcs=; b=bVsQOyjJYoYNfilh
	d+hJaNzjoDRU3gMtPuArw5HX7tFra+JelivMQB4q/nGiRKdNErNSWQQJXfQ/6WZl
	1d8z+RR2bjJYxf13jMOKCQGrfB65rTdHvc17WWAsRxmm3Eyq5q2WsjrPW3ZnkQvh
	F6+vcO9w7uE5RVs2B0wKgIZ5JGxg9/cEm8GltjouZo89rSjCvFNwPSQxp79HtkNV
	6eOdbVW4iColfHnv7GbjNAwMJkP+DmI3ic2F8X3RllYiyEbvD+ARlNSBfpIs+aOa
	NXO78+6ciM/xclFyW/IuJECFPKrPCa/BnxItkUn36gM9rBHObJwvACo5WpTF9z5c
	4ZvKBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2sx03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:30:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so135328a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789590629; x=1790195429; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PLBICahvbn3jQdn0qzJ9oGFNdxzqRaRW4Cw/G+Dtcs=;
        b=clmnN0yc47lm8C1BsWu62PkKbUosuB41iTngwHOVAu5UiiDrZsv/s62DJ4I4x52RbM
         2Pmh7wlOOLRSpy1Y5BNToHBJbgJ911TU6tiSeWWnzTD+DhY4Q8ONcBYRJaRrjScZXM9y
         D+bngPB/LZJ5JKdroJ9R072YKN5CJUeAwMn1Ksh0Z5eCZylyUgZelx5I7lRZWz2XLtcN
         0EOoUBC0OcD3x98OWTsM//WZIdBRlqG7n4Vi9Sh4+z2eLj6Vik9xHhaOWX/bBhcvgaWU
         OQnr3Rlncelyo4kEuwznQqSjlHmqoFr7RBvgdGIq4KCPyZqIemu0d5ONQA7IDQyeDFQp
         Z9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789590629; x=1790195429;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PLBICahvbn3jQdn0qzJ9oGFNdxzqRaRW4Cw/G+Dtcs=;
        b=jYar9MGht7KJT3NSvIL+GTvDz3B7rwOM37TkpIS2BthQDiIjWMSYCqoBo9mwx9zjMS
         AElwHfU8hXqpmXhLsDAO0VpYjQXdilFO0XQqqQASt3S44GbNKnC4SZbcwiAXNQs+qEUy
         XUxfgxq5bs5o5dJ7/xyOnu5HM21iTaf3BLl7d3rfjZFktPWLcd12qoSghgkhEt62LHIV
         F+vtUQgKIwWmV6qIGc37jDc3AtFLC5vqmXL/lsoT+b6SH0tbAEC8ufN0J6E9/ENfDVWg
         xYvIrUhxH5UNAaymHanPy6q/zDsU9HE0IEfZNBf6kestssmai65T5lqt8EuC4JHjmbH/
         sBBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNBOXr+qb25+guOQZUHotMpmpp6qRk5fEPS4/GKGRl2mhBeT/NREk1dYLdCnsIKRpK1A+Qymo7Vy7/RV0=@vger.kernel.org
X-Gm-Message-State: AFuF++nrOJGTTjCZLxFpxDbNfSZV7F6+cWd7QvpXERnG04zzQ8OxQMYC
	xUC9KXN8R2FM+pPxcWeFjPQW1k4brSHK9XIhg6GaCnT/JYK1HrgUI+gUgCKA0zs1TfKhDuEcdRz
	udG5tLgFbepQJwqGrwj0HSirU/mhqCMHPoddIeMrNRoDGkwYtcJ1E2dCTnoMLlhAhpfk=
X-Gm-Gg: AYBFou0cntZ+ndG4q4zMyHyD/5k1LDp0RxE1DJM2MjDfH+/YHeZjrKrGkms50ayDIgL
	og47HOxdM9+0+4yCaucknYGOGaJ+FtxSpfCsmAJh+ntuWdfcWJiJtbPx75oK+mzzSXLoP0qihnh
	joU2ieHh7vbDU+Ugd/TseGmgPhx44Sg9PcYRs6dLJruDXq4ppp4pn8lsgt5Kc5k3TIkx4oPlmkE
	ALke3qB/ncyUob9ZZi160Jo4H3PFYtEsDQjWOg4+RFAHUQWjgrUburrhYQ4jCJCrk0Iec/GwWTH
	20xld63/12iajZKdcTr+2uvMof8+9hZeZ9EQodcm+sunjkWTxCahJAbkosp4TH018/7nNQQOlFa
	R3+7dbkKC+WgrqfeYsGyCSzpOvzTitgONH4mu3cEy/7S/PYO4g2kh05vMJBcKKSo1JFNK0/wN
X-Received: by 2002:a17:90b:3941:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e1e43cfecmr9182326a91.15.1789590629374;
        Wed, 16 Sep 2026 13:30:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3941:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39e1e43cfecmr9182262a91.15.1789590628798;
        Wed, 16 Sep 2026 13:30:28 -0700 (PDT)
Received: from QCOMk1gASIiYhG (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e20esm10212755eec.3.2026.09.16.13.30.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 13:30:28 -0700 (PDT)
From: <subash.a.kasiviswanathan@oss.qualcomm.com>
To: "'Abdifatah Suruur'" <suruurism@gmail.com>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Cc: <sean.tranchetti@oss.qualcomm.com>, <horms@kernel.org>, <kuba@kernel.org>
References: <20260915195642.1912-1-suruurism@gmail.com>
In-Reply-To: <20260915195642.1912-1-suruurism@gmail.com>
Subject: RE: [PATCH net-next v8] net: qualcomm: rmnet: require CAP_NET_ADMIN in the real device netns for config ops
Date: Wed, 16 Sep 2026 14:30:26 -0600
Message-ID: <000101dd461a$3616c9a0$a2445ce0$@oss.qualcomm.com>
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
Thread-Index: AQI1rpEYjj6H3zoZieRzGESYrbZHhbYgbgLA
Content-Language: en-us
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4NCBTYWx0ZWRfX1FY/KMAAXz69
 PJYBYxCkvGvGD+/LchShLSNwxa2EHlwfNb407MwqHj0JlJUxkrw/ScPDgo/44v/qixHkVYAsvL0
 PlKezZzhnNlTfFI42eONh3KrzvNLhQI=
X-Proofpoint-GUID: MaqHZzkAfyXrUxg4V8P-g3jYSevbwdGl
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaafc66 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hSzng9yqXL38V1c8vrAA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: MaqHZzkAfyXrUxg4V8P-g3jYSevbwdGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4NCBTYWx0ZWRfX7o3qg/RR8bM8
 7c1CVMC3/DTMTORX64wX3s+GI0MWi7JM+PsQCZodk+1qUAvHBgIt5CxXPFjxyDXyH389o1Zenh3
 FDqryax56qLIe5I+OhzigUSKBMdfCY171omf5QLWGYM51n4pw02s1K1v1t1u/C8v7/9yjpcCG7f
 gJdroSGGvTBC+QReudh8fz2/fRUildRfF5aFkt8Mg8RjFng4SbAXGcy1vZLjQ3ykMwtDkR7rLIu
 MrYYJ2sbczFIL6qbZRrFmc70easb4SmBr1gVrDN4/glP3kiccZxMdc3Nkj0GCH8hhN0Wl1384Dt
 7ifIndgwLJZgvGVf0laQrorfCFynWShfy3Nm5xhHdCLC32NhduMS3FWvdx/8BsXXpE+S/BCH9F/
 kKXshW5/0d3RWgHodHLIgKsYfPE4NR3Z9MakhVk9I9qhu46bBhtCb1sbL4fMaTXefAiTP3iPSmq
 kNJtgHPqIrIdA0LQYXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160284

> -----Original Message-----
> From: Abdifatah Suruur <suruurism@gmail.com>
> Sent: Tuesday, September 15, 2026 1:57 PM
> To: netdev@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: subash.a.kasiviswanathan@oss.qualcomm.com;
> sean.tranchetti@oss.qualcomm.com; horms@kernel.org; kuba@kernel.org;
> Abdifatah Suruur <suruurism@gmail.com>
> Subject: [PATCH net-next v8] net: qualcomm: rmnet: require
> CAP_NET_ADMIN in the real device netns for config ops
> 
> An rmnet device may be created with its real device in a different netns
than
> the rmnet device itself (rmnet_newlink() resolves it in link_net), and the
config
> paths below only check CAP_NET_ADMIN against dev_net(dev), while
> mutating rmnet port state attached to the real
> device:
> 
> - rmnet_changelink() rewrites the endpoint mux table and
>   port->data_format and, via rmnet_vnd_update_dev_mtu(), can shrink the
>   MTU of the rmnet endpoint netdevs.
> - rmnet_add_bridge() and rmnet_del_bridge(), reachable via
>   ndo_add_slave/ndo_del_slave through RTM_SETLINK IFLA_MASTER, flip
>   port->rmnet_mode and port->bridge_ep on the real device's port; with
>   bridge_ep pointing at a caller-owned device, rmnet_rx_handler() then
>   forwards real-device ingress frames to it.
> - rmnet_set_coalesce() rewrites the port aggregation parameters via
>   ETHTOOL_SCOALESCE (ioctl) or ETHTOOL_MSG_COALESCE_SET (netlink),
>   whose capability checks likewise only cover dev's netns.
> 
> A caller privileged only in the rmnet device's netns can therefore rewrite
the
> shared cellular data-path state owned by another netns, and steer its
ingress
> traffic.
> 
> Gate the rtnl paths with rtnl_dev_link_net_capable(), matching the
"require
> CAP_NET_ADMIN in the device netns for changelink" series (vxlan/geneve,
> CVE-2026-68432), and gate the ethtool setter with
> ns_capable() in the real device netns, mirroring the check dev_ethtool()
> already applies to dev's netns.  Report the new rejections through extack
> where one is available.
> 
> The gates cover the configuration paths only.  Teardown (RTM_DELLINK
> reaching rmnet_dellink(), and rmnet_config_notify_cb() unregistering the
> bridge when the slave device is deleted) is intentionally left
> ungated: link deletion is normal netdev lifecycle behaviour, and the
changelink
> series this matches (vxlan/geneve, CVE-2026-68432) gated only the
> configuration paths.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
> 
> ---
> v8:
> - drop the Fixes and stable tags, per Jakub Kicinski
> - drop the explanatory comments added next to the gates, per Jakub
>   Kicinski
> - shorten the extack messages to "request modifies device in another
>   netns", per Jakub Kicinski
> v7:
> - state explicitly in the commit message that the dellink and notifier
>   teardown paths are out of scope, per the Sashiko review
> - drop the master-moved-into-the-real-device-netns rationale from the
>   rmnet_add_bridge() comment: on the add path do_set_master() resolves
>   the master in the slave's netns, so the rationale only applies to
>   rmnet_del_bridge(), where the master comes from
>   netdev_master_upper_dev_get()
> - use the netdev comment style in rmnet_set_coalesce(), per the
>   Sashiko review
> v6:
> - gate rmnet_add_bridge() and rmnet_del_bridge() on slave_dev, the
>   RTM_SETLINK target the caller was actually authorized against,
>   instead of rmnet_dev: a master moved into the real device's netns
>   short-circuits rtnl_dev_link_net_capable() through the net_eq()
>   check, so a caller only privileged in the slave's netns could
>   otherwise attach or clear the bridge state of the real device's
>   port
> - add the Fixes tag for the commit that introduced rmnet_set_coalesce()
> v5:
> - also gate rmnet_set_coalesce(), the ethtool setter that rewrites the
>   port aggregation parameters of the real device's port, per the
>   Sashiko review
> - report the new capability rejections through extack where available
> v4:
> - use the netdev comment style, per Subash Abhinov Kasiviswanathan
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
>  .../ethernet/qualcomm/rmnet/rmnet_config.c    | 21
> ++++++++++++++++++-
>  .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 11 +++++++++-
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> index bed6f63facf25..8bf385ab44a90 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> @@ -312,6 +312,12 @@ static int rmnet_changelink(struct net_device *dev,
> struct nlattr *tb[],
>  	if (!rmnet_is_real_dev_registered(real_dev))
>  		return -ENODEV;
> 
> +	if (!rtnl_dev_link_net_capable(dev, dev_net(real_dev))) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "request modifies device in another
netns");
> +		return -EPERM;
> +	}
> +
>  	port = rmnet_get_port_rtnl(real_dev);
> 
>  	if (data[IFLA_RMNET_MUX_ID]) {
> @@ -441,6 +447,12 @@ int rmnet_add_bridge(struct net_device
> *rmnet_dev,
>  	struct rmnet_port *port, *slave_port;
>  	int err;
> 
> +	if (!rtnl_dev_link_net_capable(slave_dev, dev_net(real_dev))) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "request modifies device in another
netns");
> +		return -EPERM;
> +	}
> +
>  	port = rmnet_get_port_rtnl(real_dev);
> 
>  	/* If there is more than one rmnet dev attached, its probably being
> @@ -489,7 +501,14 @@ int rmnet_add_bridge(struct net_device
> *rmnet_dev,  int rmnet_del_bridge(struct net_device *rmnet_dev,
>  		     struct net_device *slave_dev)
>  {
> -	struct rmnet_port *port = rmnet_get_port_rtnl(slave_dev);
> +	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
> +	struct net_device *real_dev = priv->real_dev;
> +	struct rmnet_port *port;
> +
> +	if (!rtnl_dev_link_net_capable(slave_dev, dev_net(real_dev)))
> +		return -EPERM;
> +
> +	port = rmnet_get_port_rtnl(slave_dev);
> 
>  	rmnet_unregister_bridge(port);
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> index 4f0ddcedfa979..53802b485a813 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> @@ -4,9 +4,11 @@
>   * RMNET Data virtual network driver
>   */
> 
> +#include <linux/capability.h>
>  #include <linux/etherdevice.h>
>  #include <linux/ethtool.h>
>  #include <linux/if_arp.h>
> +#include <linux/netlink.h>
>  #include <net/pkt_sched.h>
>  #include "rmnet_config.h"
>  #include "rmnet_handlers.h"
> @@ -240,9 +242,16 @@ static int rmnet_set_coalesce(struct net_device
> *dev,
>  			      struct netlink_ext_ack *extack)  {
>  	struct rmnet_priv *priv = netdev_priv(dev);
> +	struct net_device *real_dev = priv->real_dev;
>  	struct rmnet_port *port;
> 
> -	port = rmnet_get_port_rtnl(priv->real_dev);
> +	if (!ns_capable(dev_net(real_dev)->user_ns, CAP_NET_ADMIN)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "request modifies device in another
netns");
> +		return -EPERM;
> +	}
> +
> +	port = rmnet_get_port_rtnl(real_dev);
> 
>  	if (kernel_coal->tx_aggr_max_frames < 1 || kernel_coal-
> >tx_aggr_max_frames > 64)
>  		return -EINVAL;
> --
> 2.53.0

Reviewed-by: Subash Abhinov Kasiviswanathan
<subash.a.kasiviswanathan@oss.qualcomm.com>

