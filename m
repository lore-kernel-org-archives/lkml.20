Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611713;
	b=nuVLGhdYfoSuMYzMmBjOcaHy+90spuM+vPplRzBB4o43dTnHFsigKmigHqoeE633pbbd
	 pS+YBHf36jPOQSusl+KbiJBoPEVsISJ/C1AXew2ZWzex02HjTltMWfBzx4e4kYzBal5Pn
	 dYt5KliM8xUOLDp2KFYjW+ym4WYi9nwa9vEPbaiEycR5Yvf96mqGa127QHpOjQ9XJrbYU
	 iyTU1xDN0fVI/fMuJ31/U0B4EBVp3DIQIMNrPTvl9+V+QeZItUXUzTfdLr8vsu96Oql3h
	 Vc7DUeLUHGyC1qSDBn4q6jItyhJfHZzvzXrEJj2LJQeyXReS6e3R+Nd9pBC10brCEzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
	b=o4I3aNgeMYfXWiZ1XK1KP1q/KogavM2dh6n0Gr5Fyl1oJ0KrW/arpIeez2+IVYigINyC
	 by8R5t+amLMGtvqvzr1ygfLKYop8HWTXxrHriRHgtfPXB5bdxLn2BIakUUhs5l9cSmq4/
	 RYNWqgsSe2KbeMJxD9LdySnD7KQBE4+qmi8U+Pi67dxtlFtKo1PAltf4J0xn1HnBVGKcV
	 wN9JG4c+VQyD6UJtC11PE+4fbpL6mP4xv3Rh9psPkSUpkOQRLSiuuCXKlJcJ/dR79pyeY
	 Fw9YkLr+1SIlUPgqL+0vr9KyoB/AKcHpukUVFJtPeVKSx3etRuijVVce0HZxIWPBOuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8s1xPRn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiSGGqkS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7B7606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7B7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8s1xPRn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiSGGqkS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AM8N1821127
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bcAaWAAo29U
	XjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=; b=X8s1xPRnEUjh4VACQths5mr/jZ2
	+M5KMt5X812eVjoFa/aQIybk9po3wOmN9U/JFiupJ6T4YpD+BO942o4fIzRrIXe7
	GdRNCPNNlh36tULSxUBT499UEhDW9wYY76rpssIf0kyu1NT37P3lcFiiphBFQb29
	i8gnTKw+9TGxDjFWdgTlKkj/M94y0GEK0eq2sscr5vgrUqNBdBU/UP8OaKqZQcPP
	3Y0n4bTpSPXG+lZybYWNpT1YCGDvOeaNoOXnN4WXhx3PZuCrLan673vYDD9x50AW
	Oq5NvkosY2y2YaBC/FlCowXtfyYaQXEEcBYvc/HOJCaa+ICC6bFlLpG9vOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4gyvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:28:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso398809285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611711; x=1794216511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
        b=MiSGGqkSz9AEyjV3CJaEdqDY7lsUnjqeiSRsy1pleKRHLjayB3n891m3RrK3zeKWkM
         LtC1WoKTLK5xI7JlF8yv+X2ACYi5nlIl5LOBZuvIUPnO9PzlNIFfRkQag7frKNuR0vIC
         Ro2fetpdvcNTNbqG63hDx44uO94gdM8IA6EXeKKEc4EnmZMyl1Su2iT10id0BF8vmCpz
         zt+6An8I6v1/su46hDJ+FOoSN++YHQzi7N3FQgMtZMM2sYHfjtgUEKv8fGd2LqdFZdET
         Kdarvlr3aqUiUgm2Ia/F6JjwSxotvkCyjWywXPT4RTmZUYOtC9CYJ82FjY1UF7/szyXU
         0hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611711; x=1794216511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
        b=tja92/MtjwlfpsATLfwGSGVHr152EGmlhCwzeiX5YaW7As57quD1aqHHKmZruR3zCF
         ArQnfnztLQIh84O9Q93z0Gdry5bR2IHmHfGFpjm4G2UV3r1RMVmAE61tCXRoUSQFeqku
         BvpSZ2C3gnmSF3XfVVt1AccB+0V+RlrnoPeyIVPJUqp1hvxFZq04lkT+Xo3PYEfqrflr
         8azuXFW5/9EwZwidcboNMpImUwuIFPjhW6efjmBGcEdYBb5kUXSJqhXf8RA2YPYBvKCG
         osQWvd7DhXUHW6SDANJBGkLXFHMEBlw8tHvXDdmwJ0VQLm4+DjIcRuk9MwfyHSNGlGff
         v98w==
X-Forwarded-Encrypted: i=1; AKwUvByglVokGTCatlS7Wc9/hkNa78FaCwpRbOF2F+jysnlRCHRDa2v4oBKHZp4vv1wekEki/dfgwjURbZJW/Ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKKyTC+DM7r/PUNyeDa+rxEcM0WyACC8wSpzIdPo4IOiWt9DJo
	9UuBIjv3FVhAZ5b45iqMU1cR+EN7JlYCrIVzxSGq5AosLViJ+/KsjJ4T5i4jV2Z7bgP49BzVVkC
	OSSosSlBEBrfbYofI/pPa/AUOxqsVj5MkMVzLnHLr0rIqq0/pAUlX2IxV8KmKUrFshnXRscLOej
	dS6A==
X-Gm-Gg: AYBFou1k6Kq/w75ooSmuPq0oeuLoqnKuwIm9Tkqkt8MhYm/yna2mv+dIcd7nw9Tqqir
	6So9HJcNLqwOQQakn7/0k9KNwkAX0QvDMV5u9nsy86ePXE6hGBm1B6eqwDicJKjxjEOS2DqSrJf
	uX9zQhZHTygsmgg2i4zKZuXB4VrDYb6r+1x2EZ19JLFh5j0A+y1p5f23luxLHZ//ONWtqIL6ruf
	gOzV2rDWiyA6mIcKi090sKeF/UdiYPknkeneHGxFrvGx2F6eHlOX9hLW/bKSDN1j0YdijVGpXzf
	aO0nEXM0mmpHFfgZZMwuvAhS08Wix0u0lkvsTom9TKw7SORSQCBnarzYOglp4Yu1ntmJHySmtUK
	FDSazEihnz3fH+f6H44ZPG0fOjz9lGkvmf/rNEqOAEDTqNDKvyzbGnbFiiyKQj2hplnJvDjDEiA
	==
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr1585044285a.71.1793611711474;
        Mon, 02 Nov 2026 01:28:31 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr1585041585a.71.1793611710931;
        Mon, 02 Nov 2026 01:28:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm22171893f8f.3.2026.11.02.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:28:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com,
        "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Mon,  2 Nov 2026 11:28:28 +0200
Message-Id: <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com> <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com> <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l> <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com> <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy> <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com> <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RsLGQcPpHFVt7iVPtuvhfIh2lTB8XiH7
X-Proofpoint-GUID: RsLGQcPpHFVt7iVPtuvhfIh2lTB8XiH7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX4pKgciKNHe6R
 hTX76uyqYOk9TqVubfkKEOUjk2s2qYtRM5O8cuVPwq6qJfwAUD9nKi/UPzpAGBzR9kvIX3HjG7D
 pt4fw2+bk6VQ2/2KkP5MY84UuOvaDGs=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae857c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=MqBAt_2VOQeXeQd1tQ8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfXytpR565shDGV
 jgBEYl8m2MR4K8SanrkK/M2WD9tFWLNK0MvPuZexbD1PbFplh+TQENQe1/xMAFaFxw9uKvxv5WU
 UuxNtQ2Qs/ROpW87KRR0NcpvxqfRXJGj8hzJEgEglmt7Cxpd4/xYf4yJw9TtHl840wqHh2ghD+v
 lC8DJ34lWdo+7+hq6haztioSpkgG5jGixAp4CfNvI7QSDiPCvKSm10/8LacPScKhUYN4KHROXep
 k+hLVlBJ2Rl/1TovfBF0A2LNusZ7Dr5eU6/6vD1WCKMs8NCL9KfnRjKz0/4TS/+1GkFYuOgL9eK
 qI3H4vonyVE8xoKPDw41GbHi43d6dt9gR+GBa+OK/N9cDr0fJuBUEuO2LPMPyFhdT3XHGoE+2KD
 1VybDsO5V9xW+S7o8RB0ogAcmw5dfH9HnzabNprkBUSbW1AFiwyNELQ77X8NeABSdNdrl/8CVUx
 V7h9Qubd5J/wqBVxJZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020037

On Fri, Aug 21, 2026 at 12:36:26AM +0300, Dmitry Baryshkov wrote:
> This will be true if:
> - MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
> - the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.

Both hold for v7:

 - camcc-sm8250 attaches MMCX and registers TITAN_TOP_GDSC as its
   subdomain, so a performance state set on TITAN_TOP_GDSC reaches
   MMCX unchanged.
 - v7 adds required-opps to every JPEG OPP entry (min_svs to turbo),
   so dev_pm_opp_set_rate() votes the MMCX level through the single
   TITAN_TOP_GDSC power domain.

> Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
> (MMCX) power domain, while its parents (pll0, pll2) cast votes on
> vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
> not match, so we need separate entries at each of the corners.

Agreed that the PLLs need MX. Upstream nothing votes MX for them
today: the camcc-sm8250 binding and DT describe MMCX only, and the
rpmhpd MMCX domain on SM8250 has no MX parent. On SM8450 and later
the camcc node carries MXC next to MMCX.

Since MX feeds the camcc PLLs, which every camera consumer shares, I
think that vote belongs to the camcc-sm8250 clock controller rather
than to the jpeg-encoder node, so v7 keeps TITAN_TOP_GDSC as the only
power domain of the JPEG node. Does that work for you?

--
Best regards,
Atanas
