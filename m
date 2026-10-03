Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C108134CCF
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791034879; cv=pass; b=rmn/BaxBrGsPFCWIXvnHs5l2jlFrHbsAR4OXaRg9f+a2dLsjRNdeJ4U6SVgyJMSDlLkpENAOrq0cXZ7PZzNolCMyqYuRBgmIFt0N6j2Mm0yFhMV4OO/DUQa6hcUXKxcnCribVOjSk6GVCZTEZSDfm2oa0OgLyG9JrzWJyXmeL0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791034879; c=relaxed/simple;
	bh=UOA6JD8sCi8WMj2yDPrF0LvtP6kjcvibA/xPsZyH688=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufsQb7AurPoKtlNY9uMcepJYCxJa10G/1tgkDCzkN4r+kyMQrSwAefjWHLpbpkvniIXZ7jFcITDNSQ3nwyXBj0wTYstQaR45t9kjIDKEze/CMxUz4cYYptSWV59G2g70xxX9VtFM8ck9HEFQaa+3+IkCiGyX2dBLgXsfpGT+nRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXQSXwFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQkgqEn5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXQSXwFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQkgqEn5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693AuEXx3671653
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 13:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWZG9J8ZvfCaQmhFeJRAO4+EQ2nyl7qNd4JtnATWve4=; b=SXQSXwFgVMRrid/a
	BwdF9HLD0FqOzaPrHW5GXEP8CG3zGsggqxda+3R3aU4tFxcohCYJes64m1P/uwcn
	Ay8N1QDUj3DfEuSRhEe76Nnne52A7tDlVYzG7DDzcleN2EkIl1GqbFbE3P/+O7c4
	NB7UwAa0bvd/mYa5zAPq4JOyxeU+/9HQWKSgKd90a2wDLJ8wSThC28frj+ng6nUK
	abQXfWSZ8dcz5OTFrMwQMd0vK+CfG6FqPaNFiGlaWHBf/67vEomz2ySHCwR0x2yh
	QXI4qYhkTM2HcM5I0+egCQz0JJzSjy7NKOL86AeC23YCAM8mrQ/PadRHu3UbnZwH
	f9XxIQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tfd8w1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 13:41:16 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-879b1d03d5fso3953267b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 06:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791034876; cv=none;
        d=google.com; s=arc-20260327;
        b=ZMtaEnZvfUGp9yWoBCuP+yue9ysJdkphZWLkb+C/I+IG7fjtK8K/52uTvbqMZBpQio
         jtKnV1wr3QhjTNg49WcCSWwgDhOxWms6YFkMN8wW9AqcUtTQ1dMjRtRK634IPZ1NcO3i
         0fit0WCZWeoSPuCnPDKUxwx4BfpEMeI8R9CTqXxH/CLUC6L+fM10aT0dMGGfEKq62vzj
         YJPYLz3Cvp2SngzytsjO9IarXk7/mE5n2vkdYFz0LJEQxmIf/cgu2/m+HXZmyYwdI7iC
         eInYf8GG7nKQp8PTexrZZ0hAfEwVekEXB3+ix/M6OmrzGo4KY0vxzYFdROs169gBlfst
         Hd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWZG9J8ZvfCaQmhFeJRAO4+EQ2nyl7qNd4JtnATWve4=;
        fh=UJDxTcYzhIT4x/rip8guTqo7Ovhpv89FRwo4W1p/1qU=;
        b=eNFJRYE6H8pQUGYVz3+fPg/nFGUxcaSenSzl02NKEWQf+mmzyQuX6R07eZPZ+bAip+
         OhCFgFGWgmrfT/3UGXjxCJy75zOGuksR8ZemWZZu8/ZNrLg9KVKWDw8VSaVqIRO5yowR
         +Yrrt+gN5rxZx86/NKeFnpx6H+J3IfqJIcpI3Qan8fKQAKskapFAiMa8bLfOzasu0wxZ
         kp/XcmcoYanfrwUeP+2TckLMlXFTpO05W1Z3ZEhc0WkzI5TqjrHZAAPmeS4QBNbgk7PZ
         15OW/9tP64hnZOW6prtIP5H9U3ibVsSCfObJ+43STSpJwcYj/z9Q4Kwm3SLhHe2o3xpu
         liUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791034876; x=1791639676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWZG9J8ZvfCaQmhFeJRAO4+EQ2nyl7qNd4JtnATWve4=;
        b=DQkgqEn5Y827jPltXdifY50BHO4Yvjb/Li5xttyZRt0SfU2CUcXqLtUwMRHKybr1Bp
         z1h+hhuPzxYHBX+SLrx6/wXYSoU0W+pKlohCtydhYPWEUNAFMZLyV2OsSeH4GlhIyx2u
         eys2+1K6hAR9LN51KxoZU1HiAt8iex+3r5nQr3Zk4ZTJ++W65COwd8vjPsBNKb+MuawV
         Qynbqp2QO8R13Drzp2Q/FuFGjqEmJ5Ff4d1ServiC2KHav4VT2RtupMymUmld+JlTYg9
         5ZGKQEVRdkF02+mXV5CbLrpaW2Y6IE8gXAwEFGCScDSd3pJN7LP5f3pV64fQWGoSKX/G
         fdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791034876; x=1791639676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWZG9J8ZvfCaQmhFeJRAO4+EQ2nyl7qNd4JtnATWve4=;
        b=YJPD1VRuaX/UZa8yLzy+X59WcYjlJ6mVP6bGVItpHLmesG8pJTMGVqSAUKOuGGO8IP
         UiTvZkcKXn0gIEWoK1k1bWCPvSFbQYsazaw0F9Xzy+s3graibh37qQObvCF10GNyYR1K
         6SnQPdEm++0Hd4CVmCkiY9JM5/SaVoc0YLvKLYmcYf8cojDsZNiGQaiSfJfPPFoFRFfX
         nPED+qXBAI6JcjAIHw01/9CxwXQD4Z5EzEJw5SMNUNp9rpMoMAnRmn6lHJF+b/NsBw3Y
         ILY1GUnbr4FxTG3Jf4+ffLglMCPzM1EunL2ysAyoSLLGFdO5WbvitPJYy01O223b8xLi
         TEDw==
X-Forwarded-Encrypted: i=1; AKwUvBwSPeVpETvQLmiO7cVE1Aw94BVMirhFGWlcWwD9k6RqWCJ+s4MNfbutXIMZnRglaF+ZDQWttTX+kYNLwPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiQCEskqIKiHmkYIzYXt/x10DvsJrcfJYHXQpoeMaIy7GEyx/4
	8ERXrfof0KT6wero8Kqa+E+AI5J5kucVJOp3qz1uC3ykBB8erDy9iz/Q5jOkzxofA1gfPLbkYw+
	WymrxXfW/THfRHskdk2EM4rjyrbLihOFEfUWIRZ6gyoZPEKraG1bYiK7Z9t6oRW/t4AVVqeDLcF
	PJuSLBSV6B/tawMaAydM1DIB614pxLttTVZ4fLl6iPqQ==
X-Gm-Gg: AYBFou2SBmMeSz+g3S6RGDQoYTnJIC9QGEk4cx/x1lMmiSTXpu/9Ia+FNEKcjf7G5Ox
	xLo0ZMx0DKhh5sTEXxCkegTlbTcFibx0PxwpdJxO5iWQyu6fCFU3IGETHlFjlVywT6D96++TJiq
	yMFZ0r709BdRa93p5CqMM6kxBTVjZrYAOOJ8Y8A1sRSzgjaQvxJsYiK3o=
X-Received: by 2002:a05:690c:c501:b0:8ae:9448:14e6 with SMTP id 00721157ae682-8ae94481b68mr11315737b3.54.1791034875830;
        Sat, 03 Oct 2026 06:41:15 -0700 (PDT)
X-Received: by 2002:a05:690c:c501:b0:8ae:9448:14e6 with SMTP id
 00721157ae682-8ae94481b68mr11315617b3.54.1791034875233; Sat, 03 Oct 2026
 06:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002142443.GA778834@rayden> <84c1dc64-6380-42e6-a501-9be86666e5e7@app.fastmail.com>
 <CAGgiveXqFFi+nq0834+hwBBnwJssh16aayZBgh0toYCVN+OMmA@mail.gmail.com> <67bbda51-d1b6-45ad-b798-d8c0e53bd23b@app.fastmail.com>
In-Reply-To: <67bbda51-d1b6-45ad-b798-d8c0e53bd23b@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 15:41:04 +0200
X-Gm-Features: AclHuK_AKvv4DXHOJsSyiGB7-fYwv4aODNPt5MiUCJ6CLVwy3uWPkbDG65f1pY8
Message-ID: <CAGgiveWMy4FL+5uCLYYWOx16qPr70dKvq4u1gVdoA0Vpjv6MbQ@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LroHWXdc c=1 sm=1 tr=0 ts=6ac105fc cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=oYlp4R8hcnwt0YeveLgA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: 31ladMiQD2e0h8ZEp3Mqboz5nFiVliBZ
X-Proofpoint-ORIG-GUID: 31ladMiQD2e0h8ZEp3Mqboz5nFiVliBZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1NCBTYWx0ZWRfX94/jYRdxhowL
 m4gwNzteGzrIdNhBRfxcbTCTCetjWR9boUvuCFIfE7EAZT87Bo1pudj1H4NRJvDtSM85785hOnQ
 dMd6izXu/uXpRhnQ2B/iFtKzTXH1DMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1NCBTYWx0ZWRfX2PnnschHJ52m
 ap0obQPwfNBwVLZLja0zQpTD1ODPHG6u7gLg6V20Oway4S4C3FWwqsu+gOX7KqNJPLsdBdRK2WF
 V7fckNc0dqwZWByLM2HxFjFxOj5eV/mjzqCUbYwAUwKziVZBMdBfaFwm3WVIjhsXDLt0gJfoV6N
 AlJWIH4VpIUmyyqMdq5103g700I6oHIb3qsHSSim7Cnb/U2NxjUB83NNjff6Ie0Vu6RGXpdn6Zy
 0Kp1EPHXYKe+nL9jx3PwWH6SCZZ8CyYFZSuou6+xSdUf3y48A1J+cAl+8xzl7ee2c4mowUExmBI
 CeIaMRpLxWJX7DnWXSFZrJqata5jUDLcN3s0LbpQxTY2cKvJp2R/NRyWxhZ3KuyvVHwtBng1neR
 lA8/A0ABUI8fGjj2bke5wemQ0NLjK21F9gXWwJ9P81l3Y0Uol/kMlowk+AJ1HeH/TKY23DUPE44
 lCAOkSDkRUIgew3hgzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030054

On Fri, Oct 2, 2026 at 11:17=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Oct 2, 2026, at 21:04, Jens Wiklander wrote:
> > On Fri, Oct 2, 2026 at 4:59=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> >>
> >> On Fri, Oct 2, 2026, at 16:24, Jens Wiklander wrote:
> >> > Hello soc maintainers,
> >> >
> >> > Please pull these fixes for the OP-TEE driver in the TEE subsystem.
> >>
> >> I noticed that the contents of this branch are not in Linux-next.
> >> Is this intentional?
> >
> > I made a small last-minute change in the commit message for "optee:
> > register TEE devices only once fully initialized". That's why it may
> > seem new.
> >
> > "tee: optee: ffa: support shared memory offsets on large-page kernels"
> > is brand new.
> >
> > I thought it was better to send them sooner than to sit on them. Both
> > are added to my next branch, so I assume they will show on the next
> > update.
> >
> > Please let me know if you want me to keep them on linux-next for a
> > minimum number of days before sending the pull request.
>
> Thanks for the explanation, that makes sense. You need to decide how
> confident you are in the contents before you send them, I was just
> worried that this had not seen any testing at all because it was
> inadvertently left out of linux-next.
>
> If you are ever not sure, just mention that in the pull request message.

Got it, thanks.

/Jens

>
>       Arnd
