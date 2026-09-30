Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5B50B8DF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785689; cv=pass; b=R/kfaD+fNCDVh53TFtuXtk/Jo6H2PEIDPY53VGQ0hWMj/sNVW70mKJKsF/WpcQR//PZ8YchZMDv8MBhGRTiIjl/UUttZc9qzlXRWZpPVSLi9EvcmJc03/QSehMlWyw2iA8D6pyBb5oOlGbnZwbYFGXTRryZXRFV4k7e0M2vcslI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785689; c=relaxed/simple;
	bh=RW3uGCmb/YZXhvVIK24nGOiOoUacGo/cau2GLFCcp5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukYIVeuuqopDnJ+85V7a1ngedTgmGasWGeZH6eMQSZ8ArWQb74Pxv68R4jNTtEX8ELWY+CG/kPHqygHdNSdsRqtXCLp5D2gcXq46FV+9A7RRlm7ehJkFNMF+v6H9Q+NYKec+28XszDxmZ/bnRbrMpON9l4at82F1HVOY2Jf1/G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5x2+As4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZayxgMi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5x2+As4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZayxgMi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxqVK612329
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=; b=Q5x2+As4kHBZ7dwO
	+HybY0XrEa6O0+ssDVL2VtMd61gjDHN1TWV0nNgh1AGgETQz5anl6iAFGgjFrdBV
	FSKgIWGTuttG1RWWlOYFmiJhaSDCzyA3r85ZgAmOPuyWa0GzUNRb2U78Gz6EgWkq
	p839gJd8tGRUmM++QNZK+5MXRdKxQVqNrKQxNzhrDiEKX6LXcyyizPlbyTnmgM/I
	bcRfpy6+5yqMmm6a2+Px/8RQ31UUJRrgtTPGJmFedPt5rpPBJW1AbWMc12khzuuW
	z8O5GitKuuyQwHFcrZtlBWAa4sDtjOqu8KQPA560zF8OhgbckVonyllc1R8zV38D
	92wTRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh81vsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:28:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2ebeaa0a4so4723485ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785680; cv=none;
        d=google.com; s=arc-20260327;
        b=V/IteY21YIf/rwkry3g73dWBgs8ZeqyUkZasCFYmNgYdbTZqApbdOx7+0sM29OL7Ve
         sYYmXLPL64Ya4+rxICY/BM1P/0G6x+nEqft0OyLXmKT4xSYR5rfuIE24Fas1O7CGKdqL
         xjIPiGpBo9v7deVCieK9f5SV1aHB/E2n30RswCYjjW9x7HjpR9E79EajnvT11vhwQLxT
         1IqnHG/UpBSU+t+SBFe12/0U5xPlvEa1xE+ZMf0YjgqRfYGQLGGOrZ6roHK5pqSEN48M
         aoIZZ3gIxO2jKkN7pkHvDJfT819MylOe4eqPHdctGKGkpXAUggTVLcIzf3S30z3QtwdS
         BqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=;
        fh=lCMaN223F6JyDFRjO0K8ci8H09UBBU8whXNl9F0nPUg=;
        b=A8FHXuq2uXb/kCi/GUrcK/k3d1o5BkwjLdFvo9QgbPy5S4JIWPoTUOWvapXMHULj0k
         aE2PJt6GoZYTuMqoWV4yqqTPKAZeqZoLGDFTMmJ4cjK+410O4CqKEJ9x6Ic++pQx819X
         1+H1NYxtVRvcIEzIPZkOBu4subPSHo6FdMv5AWat5rPp4upO9yaOFK42nXT/8QTsqGF2
         53A8VFu51zny5SWY6Da0qETvXqHFCzNvVFlSW++3LG7csNWd3LIz8iBjYFOLWFiO70L3
         sH5Zjz+vBxDXV3s/PLn06oO3siMT8oKRvH37rZn5LwcI7rpMqeC2cwfEU1u2ox9vBte4
         j4cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790785680; x=1791390480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=;
        b=jZayxgMiw5A3RnPMrMWk/VmzME1iMPBZD94KEdPN8ICiUl+r0UWLFjV/ZooxoKWElK
         zcv3ifylulK+O31tNoskG7Twv9dEAVpfEhBrPRenm3vdUyMHZwQk7mT97pkgleR8TJRA
         rYJWOlWMQC2Zns//YmvAVTcLEA9q2ovJVmS59/TwuCzwDqWq78ido+1kCuJWOYi4yqch
         XM6WVpEa9JIWZ7z0+P9BLjSpI8tJOiTH8iWLcrG9okHUc2LhlnRcYt2ybs0sOVVw2p9s
         u1FK3cq128UB1OjbgTpfApYk2PemFjyg0jsBECT4rDvTYT8lZTucpzm3q81y/8QCOJcV
         /dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785680; x=1791390480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCjsUvQvBFYeGlDeqe/l1mzECLbYIdMCGVXXVfpVM68=;
        b=FdYmOw64s4L6usoA0HF2cIucCaGUFS6g0GFUQOJkiE5CzS3dGn+bh/1PCGf6Mh+ASH
         nMq9MOu3CPLYZHNcxN1PiW3GCKummiiEclOO3P0xExJlLNVnEKh/Be8/rdBhlsJPgVVY
         hqEginOOaCGNohgP1zJZtzYSGPlxw3AA8emgll6X3ouzNjkNm5nl0YmrYi361sBgyPBc
         9lOyNWsckhPYOG5pxIFIWo+i5MUtJ9aZwtYItr9cRGa44EILjYkSISSfR9B6k0S71GkU
         fzzAAephXcFQLd2S4ZldsWFpuWfqIyRU7HuCNWDWMlzekX39ujmDOkAYKo/n0D7EVT4I
         hEgA==
X-Forwarded-Encrypted: i=1; AKwUvBziCqxCUJVP8c6YoG2XD/wc4OX7XdIx102k/SXhKGFNthgf5sRAGVVR94G+NHOK9IOKEudE9BZP0fABlBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIABTiqKGfv7cHmg0jeEZ6dJdCV0qZlLmxeLi6pEWR5eM2sP6li
	17TD9Ftz3a85sao/Tk1aTyPHr1vnBVbEurHHGXmjCR5wX6jFB1oxjgnX9cUZRkEP879j2Cg+3X7
	BFVL+DgIIF3GfC+t55E4IFom/PJ7Y6m89wn9wINE0+ZumHvV3qj2J3qXbaZw91OwvhYI2u7rX0s
	IIFkDYvdHNmbFOvExKooIAlmRIv5zPwHDFRcBBZndn3A==
X-Gm-Gg: AYBFou0ZEkABwwNGUIJjHnqxNy9fJ8hX0je2a/gG7oPnjqyoCvq+kz6UghPtUWUQLuh
	/cwfQGsX7rUHhbLJePaQBPfF/erxE3fpq9ZavqVg12jFLgdvL/OSoQDN/TBT1GDTI0F6eBZRG14
	cTSRF0mSvxZUK+wJyrIzcuJSPjt7753ztvy3UKSf9Hq8SAS0LsBxJohCrXigS5fvUmGAphwDABE
	wL4xl+W75pYSSI37A==
X-Received: by 2002:a17:902:e948:b0:2df:a21b:12e1 with SMTP id d9443c01a7336-2e2e4918401mr15080055ad.3.1790785679733;
        Wed, 30 Sep 2026 09:27:59 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2df:a21b:12e1 with SMTP id
 d9443c01a7336-2e2e4918401mr15079785ad.3.1790785679221; Wed, 30 Sep 2026
 09:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com> <E53A82A427F8520F+9bd01d71-8b02-4fc7-be63-567c44b259de@linux.spacemit.com>
In-Reply-To: <E53A82A427F8520F+9bd01d71-8b02-4fc7-be63-567c44b259de@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:57:48 +0530
X-Gm-Features: AclHuK_mjB9IIz-du31WR756mfxeN7AReNTvfzYa8Zcb5OIQ5GE1Yf2pFwXiAXU
Message-ID: <CAHuiULASZ4r2DwrJYh8GrkcOFycAROsWN_1Cxnj5PsXWMVFotw@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfXwZ+jNyEKtQ+f
 cPnXVo0TP9Sh0iz9wraqmy6B6tZmlp4N9GCXwtv5PJpO6ZCMYI5/02tqx/UsSJc4VnkyzRHN4r2
 OZCwcLuQlgKa8WXGTJm1gs5YdjXMAvYKYcSMBLTgEf9Jae8+S38ym/SguhuJHEZssfKDHs9chAk
 Wa4ONmgORGax6A2Knx5dA3HbKkdt/x5FYOcrQM5DFPM6j5KlQ/EpPsbc5nCJYE5Qq4/Ki1/UAgx
 s/bUpXJs5h54tF6sL2BYOj54uOo0pvFt+YLJTY0UtOHQAsyvdX1gyHUaMXSqvryqj/x78RnFOC+
 KunjmHKU6aWcrYkfry6jvlwM1za1F6IWTXl2dPkc8yCEtgthHAMgVGSGE5MCNZmQLtGZCyQLbgH
 Tkaew21A5ZlVEMSPTNavp5F4jIUXrTV2TZcnKxxTLVl21QgabYZzUXRs+MgF9Jm9DRPW9ZsB7c+
 odOvFunT893tIkXMpBw==
X-Proofpoint-ORIG-GUID: 2GanpvzDB20T5eaFojsiemQbJVjh9yTT
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd3890 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=lv0vYI88AAAA:8 a=rVxIM9veg9Z6xXw7olMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: 2GanpvzDB20T5eaFojsiemQbJVjh9yTT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NSBTYWx0ZWRfX2PPezTBQ+kcp
 h919h774kltBrjEPTV233BUDPBUd4ZlrVmnp4TDzbLVk8FJDu3J+iXnlVNwT/yc2k2pYApA3vP5
 TPkhhaZQryYa/NSui2K6PfWVYMhZkHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300065

On Fri, Sep 11, 2026 at 2:54=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
> On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
>
> > +static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdat=
a)
> > +{
> > +     struct device_node *parent, *ep_node, *rep_node, *rdev_node;
> > +     struct gtrace_connection *conn;
> > +     struct of_endpoint ep, rep;
> > +     int ret =3D 0, i =3D 0;
> > +
> > +     parent =3D of_get_child_by_name(dev_of_node(pdata->dev), "out-por=
ts");
> > +     if (!parent)
> > +             return 0;
> > +
> > +     pdata->nr_outconns =3D of_graph_get_endpoint_count(parent);
> > +     pdata->outconns =3D devm_kcalloc(pdata->dev, pdata->nr_outconns,
> > +                                    sizeof(*pdata->outconns), GFP_KERN=
EL);
> > +     if (!pdata->outconns) {
> > +             ret =3D -ENOMEM;
> > +             goto done;
> > +     }
> > +
> > +     for_each_endpoint_of_node(parent, ep_node) {
> > +             conn =3D devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERN=
EL);
> > +             if (!conn) {
> > +                     of_node_put(ep_node);
> > +                     ret =3D -ENOMEM;
> > +                     break;
> > +             }
> > +
> > +             ret =3D of_graph_parse_endpoint(ep_node, &ep);
> > +             if (ret) {
> > +                     of_node_put(ep_node);
> > +                     break;
> > +             }
> > +
> > +             rep_node =3D of_graph_get_remote_endpoint(ep_node);
> > +             if (!rep_node) {
> > +                     ret =3D -ENODEV;
> > +                     of_node_put(ep_node);
> > +                     break;
> > +             }
> > +             rdev_node =3D of_graph_get_port_parent(rep_node);
> > +
> > +             ret =3D of_graph_parse_endpoint(rep_node, &rep);
> > +             if (ret) {
> > +                     of_node_put(ep_node);
> > +                     of_node_put(rep_node);
> > +                     of_node_put(rdev_node);
> > +                     break;
> > +             }
> > +
> > +             conn->src_port =3D ep.port;
> > +             conn->src_fwnode =3D dev_fwnode(pdata->dev);
> > +             /* The 'src_comp' is set by gtrace_register_component() *=
/
> > +             conn->src_comp =3D NULL;
> > +             conn->dest_port =3D rep.port;
> > +             conn->dest_fwnode =3D of_fwnode_handle(rdev_node);
> > +             fwnode_handle_get(conn->dest_fwnode);
> > +             conn->dest_comp =3D gtrace_find_by_fwnode(conn->dest_fwno=
de);
> > +             if (!conn->dest_comp) {
> > +                     ret =3D -EPROBE_DEFER;
> > +                     of_node_put(ep_node);
> > +                     of_node_put(rep_node);
> > +                     of_node_put(rdev_node);
> > +                     break;
> > +             }
> > +
> > +             pdata->outconns[i] =3D conn;
> > +             i++;
> > +     }
> > +
> > +done:
> > +     if (ret) {
> > +             for (i =3D 0; i < pdata->nr_outconns && pdata->outconns; =
i++) {
> > +                     conn =3D pdata->outconns[i];
> > +                     if (conn && conn->dest_fwnode)
> > +                             fwnode_handle_put(conn->dest_fwnode);
> > +             }
> > +     }
> > +     of_node_put(parent);
> > +     return ret;
> > +}
> > +
> > +static int rvtrace_of_parse_inconns(struct gtrace_platform_data *pdata=
)
> > +{
> > +     struct device_node *parent;
> > +     int ret =3D 0;
> > +
> > +     parent =3D of_get_child_by_name(dev_of_node(pdata->dev), "in-port=
s");
> > +     if (!parent)
> > +             return 0;
> > +
> > +     pdata->nr_inconns =3D of_graph_get_endpoint_count(parent);
> > +     pdata->inconns =3D devm_kcalloc(pdata->dev, pdata->nr_inconns,
> > +                                   sizeof(*pdata->inconns), GFP_KERNEL=
);
> > +     if (!pdata->inconns)
> > +             ret =3D -ENOMEM;
> > +
> > +     of_node_put(parent);
> > +     return ret;
> > +}
>
> Hi,
>
> These functions operate solely on generic gtrace structures.They shoul
> be moved to the gtrace core as common helpers to avoid duplication.
> This is particularly important for mixed topologies where RISC-V
> trace components (e.g., ATB bridge) connect directly to CoreSight
> components (e.g., funnel, TMC).
>
Yes, I have moved them into separate file in v6.
> Regards,
> Zane
>
>
>
>
