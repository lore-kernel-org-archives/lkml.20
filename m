Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794395513;
	b=XVum+tkWy36L/aER1wRUYQjZZa+qDPYxnK5EswTF+Nf/XARa4WlkzY8hyvdIQq1O/e7q
	 mFD023N629MMGrGP8pYw/zRdBQNpBx/FBTbOYl9mb4NmNoSUAdmqboUF2GQNPSyM4+l8A
	 sFwJGNbKUp/CdsQtdiWWSupz36KLIw5m/cWvJVZgvFCaMSfSXwEbWRwt6sUpRJWKYq9bV
	 ZlUaZVojhltCYHrOnC47st7vrht/+5LpKO1QcibT9Za9AmgeJEwVppMALzNSzZj8ix5AD
	 3TqqingIzLka3ulBrZQEcsKGukIJWBkM4OJUgKF2+uuVUCDLNmJ35Q6YZODR9Zx82WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sQA6vSgV9Z7FYXqSNB/QJltNWmeQcY/nmAVpGxD2qac=;
	b=lcBB49g/RQUKWwnMDGWMWqn90m9e881KNIG2XTPomBgIMQgTOnEEaoF3QLvE2UinF0Og
	 QoeJvWPIxxQYfGiH3Eh5OjPtVQtvqWiQJl3u1yCOi0fWgCZE2HAhu6AxZJ+SpAAGyBgwH
	 7lodKl4Y8+7J0LKe1szCCVWkoBPKJ6lI7Fn+DM/pdTh5DP/RdC59IM9kQ7yprkipZZaM/
	 E5fr9OYz2IRLUgWY4p2FIfeKGgpieLiIKriGdg4QN1dipUN0gFC5XXk2s2M/WVCCh37AF
	 TguMmrTkG8NSs/+uPCVDU7QNrAhP42/kjzVxq8AIBNyWdXp4721h/u9cy9aJT6aF2Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YgY/QIRr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQSfVKrk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9B606A8A6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA9B606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgY/QIRr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQSfVKrk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KE4X1409027
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQA6vSgV9Z7FYXqSNB/QJltNWmeQcY/nmAVpGxD2qac=; b=YgY/QIRrZFMzbzmW
	MzKRTG9aKYcVm16Ma5TDn+Ta48t7wuFi2vmti1OqRR6DR7hkq4zfPJUcw0fw94MC
	ebcCqPhwbq7hgJm0MZaH5+PdVvd6Np6d1FqrDnkQjdnob+lA734qTAvaU7fVwmpf
	0QPS4327Kij01XUc1v1JPkuD1lY1TnTsAM90K4iWsDc39alhUrdRzAU7m7ZYd7zN
	+boJTezp1cDIv4rx1rhYkr0xIqRv3BUo9EtSQ5LuRv4fTc3zKLSNNhXDG93RUYIB
	+DmPFdtXD16Np5+YY8AUEhIVakIJdQYicQ/RiXvTDRu8GFRbHDbqJk75MB2e8Z/Q
	hsbMjw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhjgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:11:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so1741216a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794395511; cv=none;
        d=google.com; s=arc-20260327;
        b=HSQX61z4oAGzmVhHnCL6t8Xr16S7W8I7LIF6VPKrB1AHLcMlR0d2XH8/e1D9/r3cA+
         IC2+qBpoT6bUhg73+OV2YoZ4wlfOIDz8MEpnjRGu63l8vPNre1mH256/n6lOVKiURaq6
         n9f0cLrrmjdookkeE97pXuW6rdomztfs5XsSymtT+RhJgbT5CYOARRolu8S8bdSwASao
         1N3YX3M5Sc7wkKvrZ0fuwDv6A4+aphWOaY/UqVruPFsgv4Scy7y4ms1iNnPKiXJ7iIeh
         M36XsWKb3hOZnjYMadRlr3GZX+3vVyqx1zeyFqR+q4raCtKLxSbs+RNdC+laayFD6KTt
         5uXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sQA6vSgV9Z7FYXqSNB/QJltNWmeQcY/nmAVpGxD2qac=;
        fh=yBOIOyqCG+J6SmmWeZYzeQoQa6qCToXB8nAPFD7TEys=;
        b=Vl3axrhoH5mO8KFSaUREhkgQmt/JW4n/WfFSosJF1OyLTH10GzUYLgHr2DtoYjRP1E
         8CrX90//FZyzjM/mZXJvUJbQv1YmtrO0hUjOuBMZOpWqy2OuwdGItzbG+CqI53WuXt3c
         6cV69bzr/uZNaqZtfykd3AR3JQKrv8pSQaxE4LJk63KEaoIk4JnlDb32COdKlRX+2GOf
         PTQj9XE1vFI5P1HLAUUJS9A5jg9oXVlSSbVw+p6Wxlw0fUiyRqGQL6dfxggfCM9t/dpv
         UHJzUhD47D0UHh2hbxqK8nMrNq7Sxi5PwbHGxO17tUiwvA4s2FS7wm5L1PxQr97GEIe5
         mEWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794395511; x=1795000311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQA6vSgV9Z7FYXqSNB/QJltNWmeQcY/nmAVpGxD2qac=;
        b=FQSfVKrkBzqBWzcY48erblgL88HpryEfy1NDvzWpxZUrAwOnIAhDXZUflLprhar/96
         6KwtenxYYbcgnDA921zegLlb3fMQ8P1AP8mSNIws+1XuPjC8A6BYWVpVJ9SjCNRyQukz
         W7jsJgQ5XqVpeW1jw+yudL0ZpFKlIv74+OxgmEqBNgS9U+4JZ+VjcZCLovH1ZdEtoQFE
         OYxb8zSBcWRkvf1qjeRldBKrJTQ6PixrZcPa5QdQu8MT/mjr3EdvxyRirpT0zFbL6AEv
         suX5dm9vOsi+XiKFT0/zDkkhFRspTKKDSVfVnDGNJCT2hQxFQUaXsORqLGFePz+VPtv3
         7Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395511; x=1795000311;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQA6vSgV9Z7FYXqSNB/QJltNWmeQcY/nmAVpGxD2qac=;
        b=y+PHdgMOFHekhfVCxprEGgQyQURv2vxr8a3xTyujh2ecIdpLdo3voG1YLs5+7YkSPG
         HeUAGs+wxppIJXsbF+ppmX/mQgorneV/baEWiMeLvG5DS8Z0im6sk6Jf5tL6hiNegkNS
         IDTIfFX5dtztWCasQT9Ezk9x+prQ1Ua5jp/WIB7RaNFxDkNDT60TEJKd7X8Esft1z3kL
         F7l6tyDXZdoErcm9gRbsUBLVdNKWPURwAkH7eN49ZZ8HoOp7Kfs+h2P/n60v7X5Pttph
         e14Kf1lBELY+8p+/qj3PNG55ZMAZc+PyIuw2SQRh0HQ+bBDSXbRTKIgNNQrkIVFoplOX
         arDQ==
X-Forwarded-Encrypted: i=1; AL+hErEv2x4shmZFd76/iIFqUHx7PN1xgDz07aLx4hCG1hlAq2VpSJlnzhLyfXjd46DST1EypYiCSil1o4coKss=@vger.kernel.org
X-Gm-Message-State: APuU4Z/55wIbaEmhPJ4qGocxhg7DQdv+QgNK2x2/ZJqcFHd1bQ01zI/i
	wlIKZYxBOuDzore7xfYWf6gjESMABV0hcQ2Dq5zg6j2iMAXpVJfvdbQRzaYZ2e+/pSSoY6oc1TU
	f9tSCz9u2zoAXbKOs5LT26U1zKqYiWX/1raRH6DUEtDRN7oQykTL6D08kWoV8a/vH94FjckvFaZ
	bv3oKW0kwH8tdBx4PFlfKZUQ187xcm108dS0KNGCJlBg==
X-Gm-Gg: AYBFou2jfp2432x4nj1w3DLEcBtzOku7Y5KJXfY9q0WNelDRiUknpwJD6/DD+5oHiRo
	EFLOs+D/6ApYIXyzzWz7Hvm+EINEsV8dcPjyl+voYpLVhr4iiCHD2upyOpTkmZZGdlmDCBu5D4z
	yBO34XcOeOWy86mQuNBsailgIR2iQPO91DhDXinO94oh6/elPC1EKcLG8TxQ==
X-Received: by 2002:a17:90a:e7ca:b0:3b1:6e5b:c89d with SMTP id 98e67ed59e1d1-3b182fbf462mr2113808a91.53.1794395511068;
        Wed, 11 Nov 2026 03:11:51 -0800 (PST)
X-Received: by 2002:a17:90a:e7ca:b0:3b1:6e5b:c89d with SMTP id
 98e67ed59e1d1-3b182fbf462mr2113784a91.53.1794395510596; Wed, 11 Nov 2026
 03:11:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261110192834eucas1p1e183345528f097cb64340f36a03e4b14@eucas1p1.samsung.com>
 <1791876245-190981-1-git-send-email-shawn.lin@rock-chips.com> <4a1867dc-7bcd-4c63-bdbd-a533043cd91e@samsung.com>
In-Reply-To: <4a1867dc-7bcd-4c63-bdbd-a533043cd91e@samsung.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:11:39 +0100
X-Gm-Features: AclHuK-Sms5exrjRwhrlsco56VGoUf7zoR2ZorVBgLiKAOV-koszXKzt-bUZ9ek
Message-ID: <CAPx+jO-YxwhG3TpnvFBFTXmf9XCdoi4eqeHeWwqmAc9BL_v=tw@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: enable MMC_CAP_DONE_COMPLETE
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulfh@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af44d77 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=hD80L64hAAAA:8 a=s8YR1HE3AAAA:8
 a=prSSRhHsvR2v3qUKyjIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: ZhcQFFIIZo65Gw735E4qsctUQWG5rY2y
X-Proofpoint-GUID: ZhcQFFIIZo65Gw735E4qsctUQWG5rY2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX8Vmywd205QJe
 bRBdUoNT/V/qUG8/Y+kQuDvYIjLqM4cwe0lsVIoxy4Zjqryd1Bpf4mGA1G9IQ5ZtceeuLsYfwxb
 AHnaEK6dun3M7KcG0RXV4H9mE/UUCxYckA4oxEJ/VR1Jj2EZg1ywD1rMYEE1phCmtpa2Oxfhocd
 01dJh1wGiWvDtH+3+0qcczrJQTZT9ODXdATsnth7VJ5/ARwjYo0s3uKSrGGKB7Eqf3AlrdrWyUx
 2AeHowBH8dfqovJ3PTO9UlfXuwr78AAZtdUGYYlG7qABSa3wq2MVE2QZS+r4Rm4IFd4q3Ai03n2
 I247j8FxmRilPcguovJFJRuapCwcnqJckLxgcHH2G+he3w2ggN19+yo8+hUcQPP+oDEgJi6W8Sa
 kA8g3YCilQmqPpH+MnLt+2dF09C+7rmPUjGTN7Dk5AoAl2CWWoq/pN4WJOlwPOBmTrUJi8zoT/L
 OIQRjw9lvP0PqG25CIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfXz99TwBn72++p
 A7BHQhmJXokLQoCcAoMsIeP1poYcGQJA6nueY2m0hWhTXVAj/6IfL6BrpoMUVVhgLypS3q32KhS
 JWWjCKA7GXBmdbKHjAEx08CmSQ7zbs8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110044

On Tue, Nov 10, 2026 at 8:28=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 13.10.2026 09:24, Shawn Lin wrote:
> > All requests issued by dw_mmc are completed from dw_mci_work_func(),
> > which runs from the system_bh_wq workqueue. It is therefore preemptible
> > context and host->lock is dropped before the completion, see
> > mmc_request_done() in dw_mci_request_end().
> >
> > The dw_mci_interrupt and the dw_mci_watchdog_fn never call mmc_request_=
done()
> > directly. So every request is completed from a sleepable context with n=
o
> > spinlock held.
> >
> > This is exactly the contract required by MMC_CAP_DONE_COMPLETE, which w=
as
> > introduced for hosts that can complete requests within mmc_request_done=
()
> > without deferring to the core's complete_work.
> >
> > Without the flag, the core records the finished request in
> > mq->complete_req and queues mq->complete_work, i.e. a second workqueue
> > dispatch plus an extra context switch per request. With the flag,
> > mmc_blk_mq_req_done() completes the request directly via
> > mmc_blk_mq_post_req() -> blk_mq_complete_request(), and a following
> > request completes the previous one inline from mmc_blk_rw_wait().
> >
> > Measured on an RK3576 SD card (dw_mmc) with:
> >
> >   perf record -a -g -F 999 -- sleep 30
> >   perf report --stdio -g graph,0.5,caller
> >
> > fio: 4k randread, ioengine=3Dlibaio
> >
> > Without the flag, the completion hot path is:
> >
> >   mmc_request_done -> mmc_blk_mq_req_done -> queue_work_on      (~4.3%)
> >   ... -> mmc_blk_mq_complete_work            (kworker/5:1H-mm, ~18.4%)
> >        -> mmc_blk_mq_complete_prev_req -> mmc_blk_mq_post_req
> >
> > with the flag the workqueue round trip disappears completely: there is =
no
> > queue_work_on and no mmc_blk_mq_complete_work in the profile anymore, a=
nd
> > the previous request is completed inline:
> >
> >   mmc_blk_mq_issue_rq -> mmc_blk_mq_post_req -> mmc_blk_mq_complete_rq
> >                                                   -> __blk_mq_end_reque=
st
> >
> > This can remove a redundant workqueue dispatch and context switch per c=
ompleted
> > request.
> >
> > Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>
>
> This patch landed yesterday in linux-next as commit 80636b762eec ("mmc: d=
w_mmc:
> enable MMC_CAP_DONE_COMPLETE"). In my tests I found that it causes seriou=
s
> problems. I found that it is responsible for corrupting root filesystem a=
nd/or
> journal.
> Reverting this on top of linux-next fixes the issue. Unfortunately I didn=
't find
> what mmc access pattern causes the corruption, but running my tests and r=
ebooting
> boards 2 or 3 times usually ended in breaking it.

Okay, that's not good! I have reverted the patch on my next branch for
now and added your reported-by tag for it.

>
>
> There must some corner case missed in the analysis behind this patch.

Yep, let's see if we can make it work. I assume the benefits should be wort=
h it.

>
>
>
> > ---
> >
> >  drivers/mmc/host/dw_mmc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> > index ff0b25d..bec777b 100644
> > --- a/drivers/mmc/host/dw_mmc.c
> > +++ b/drivers/mmc/host/dw_mmc.c
> > @@ -2945,6 +2945,8 @@ static int dw_mci_init_host_caps(struct dw_mci *h=
ost)
> >       if (mmc->caps & MMC_CAP_SDIO_IRQ)
> >               mmc->caps2 |=3D MMC_CAP2_SDIO_IRQ_NOTHREAD;
> >
> > +     mmc->caps |=3D MMC_CAP_DONE_COMPLETE;
> > +
> >       return 0;
> >  }
> >
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

Kind regards
Uffe
