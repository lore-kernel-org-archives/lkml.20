Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033DB3E51C5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807335; cv=pass; b=PZMtsNA6O5+3KlhGASlMlBDZCFz0QFAeu/pNimcJR6vwlTKTbVdWudYmcJunKmixFAXZdTqKv9zQtVaPc1rzFV7tdk7pvCoU3if1sZia8w6WpbnmrE6dmQlm79Vbtcinq7VFE/+cE3TY0zurZCUT3K+PFTZt8z7aAqWJjjFGZnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807335; c=relaxed/simple;
	bh=XkD4CR8PxcyIMPcQRsfJGKsjJYowH3YGB0feBNav0jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqpauHrjHvpEAZT3YYs+CX1T3rTKJkoIXIxJtk+ed+hSmAhjxX5HCW8gLhLRBvviwAMbclquNKjOu/LzEgj+XUJNsum8NAw2dCtcuPBYxeT/xgxrw1uC30pcN9dyfaOWs2pr5U1LQPp9/5dCiPgJodT7M2fpprkbZLIi9XOov/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIgjJlun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vu9ljooc; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIgjJlun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vu9ljooc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0F0E1236269
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=; b=iIgjJlunebaL+dQl
	y7kyAnjPWPQyVlo/xPz7GIFkfZwEikr1zOuPIKSPYaLj2MtDHc1fdFB8f8op6wLW
	+XMplFk5+Z7AG/jH9ZuL2TiFzMPP32hMGXSdfS3lnuyq/QzPeecOx44JYznM0IQH
	Y05Esm7GtzezMV7x/ugGG37oRlDmgeWBqjUf9QJgdGl5QU+MQ0MJEShQEI3MpopY
	Kh22adoL4j3mzdXhgg2zOoQxIYBXT0260kg3Ri3iozM5FeIa8lQ39KhkRkJ8ufu4
	asQXAmQZl9IqLL1TX4ixiUNYH8p4PmLogxZ9ZQj/y0R2aEuC0LAieJO3S7XcdBo8
	pAxgzw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6djw2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:15:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91256a7b7b3so30546216d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791807328; cv=none;
        d=google.com; s=arc-20260327;
        b=CWWvnk3DK7zwbwxGiOnJfgQfGg4bUQikdRTElwuMRXC1AGs1uPod7fclwN+64AVwZM
         n55B250ipp2T2TTA+WQxXmOY6kdi9GyXqv+F8fe9QaIPpiIeSK33xhMVfLzLiIb8pgEY
         Jo/bQEbtcKzAcy/Hj6I/Cm2tE5v/2JRrNtWdrCPDBpXtNnXI8MduQVA3N1R51ffzm9/9
         UjupM7oLI46gio2uYOrJAnvYHg+Co85Xpf8CqdChpDZUfZx+ZWWpGZAJHacNqSBi6hwU
         ThHAZNyDnQNR+ldD8deePDgpO3mSMyKP1nPBKZJ6S3AMMYqt0l0Yv6vk6RgW4M5U8TZG
         LG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=;
        fh=gu7QAZgALOqCpst3y1sDk4rJ/8umMmjK+iOCn5gMRAY=;
        b=h+DhRGPTBk4eiM0Q1z/rvplC5nIFg+gLQBn16BT9tFTHiotWq+BPncOC47PuGoK/l3
         f/uFMCRlkYSRxgtbgjvMditbh1yH36zkVZRFzVtPMDaKXBq7OaHzs0DKA6j9FpzlMYYt
         x2cy9DMOq7HRm9pMlTWeonubdeTAvI9WlKYg33opEuyPpQ+jLmTe/jLNG4G9vg67Y/7q
         3fLDQFcschtGRPthFMVR3D4PLdvW5NhmaYy74M2Tne7K95HBUqEs0pVf0F6cz0t8PbtA
         WOzXc8co7eIWdtJBoNpO7MeJQQQfLivt289q9YC4JEq0DoFoh6VK9RBhBFhlAjnzyAT3
         bmQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807328; x=1792412128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=;
        b=Vu9ljooc4h7irLf9A5f0CVe1PiCwC8cliBJzbgzpTyS9aWXjcGm8iP3LQSwKbrTrUC
         6Zvp0UPE/M0HtMR4uNUrrMJNZhgtSvb6u8q3rCEk72HEf8hU/ebYtrWSLqC9u7P9eJX+
         FS96jodkWiVJAgTKZoYZ/EZe84pfythcLAUcGuR/5tQrrVJxzQ5QHRRk3pRJLCuhBKLr
         wsqbKfKOkGB3TsNBhjo8NZLEJSm8S7cm94VhKH2Hfsa7BvwcrJljyyGFbt+Z4q50wmap
         3McbowlK2GNbetu+QTGaFCLw/To4gBhCnIhhg5xDutc/vfeiKb+PXEYPShr58jtSMDWZ
         6A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807328; x=1792412128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=;
        b=ap94X02vooqmK4Ji4ezRz65w8klwDQwx2/yTehMSK0LCJvAEYdu2Rw/dspt4qXEX/Y
         H4ROICPty8sx/F8tG+Sc6po5j+LrSUxpd7IJuEb4dHvktQYqeQpTcgqlGYEI2UKqcM8S
         G9MaBdEoPDFh/rSTqkjeiH8zvLxle05TnrfnxazGnOOtQ2ynuXTGjIdBBByquE7Tlowg
         7coy/1+S08QRaVrePJ/w+NLR1vd0gbxU4GU6erBZnnYSSSzeExt0918fwri5uXVI5j5B
         FAlMbAe2zmtnBDrl8g4KE6sOYPr9gIonnyYHzv7cxw+lX4Qjrgved+wBT4QeD8B6Vi6M
         4fOA==
X-Forwarded-Encrypted: i=1; AKwUvBxg+TFa1e524B56S4n0JlB28W/taK3F/oSIaMWDzkp8Mls7WzUvB1BUuObv45mGMQEFrtc+toEPvVOI04k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvbWaJXGaSk+pHTWHk+OLua3ZvnlrJa4UmcWV97sd4syr06fBH
	z7N1i1C5QRL2+KVyD8uaDeaY6DwvATLrzPfs+KacOp7c9jhPCO5iQaVLrAbN5izytaUYm3fQXUo
	mzrSjlU91Ki2FXo+/hwBjeZpQckd5dP0suLrIyZFqVoEzhbuesItsLvTlUHgscyCEyk53bAyipU
	H+Wn3nwLz3spOGE+QRk8qMpAmDEdrbn80irst2bHS3lA==
X-Gm-Gg: AYBFou3fCNdSiy213QYMyLk5M9AaZZ9wZwx5F6q2YaQiDnPwS9aVtVPmdnSFzHeDDSO
	b/40j75wEE3baCJkn+PS+DYZ7IS+xvtj9xgtKO+Si/8X/2yQA2SCGVDNt5kbGpWirKPe9ctj3hq
	5tZRBYhDsem0V7TFxjDH2acQjGcn37MX/r0asT9F+Fl+tgzO5tJ+bOy/Y8exzKiclmt6Yud/TDP
	W0g23RzxyOq+UyXQIF9x+s3DqnfZm51AL50Jx/YPZAjPEYRhCIDL6VDkVQjXpqL0xZIR7XomSPj
X-Received: by 2002:a05:620a:224d:20b0:93e:c619:92ef with SMTP id af79cd13be357-93ec61994afmr1003158185a.42.1791807327098;
        Mon, 12 Oct 2026 05:15:27 -0700 (PDT)
X-Received: by 2002:a05:620a:224d:20b0:93e:c619:92ef with SMTP id
 af79cd13be357-93ec61994afmr1003152785a.42.1791807326529; Mon, 12 Oct 2026
 05:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007182238.1154851-2-peter.hunt@opengear.com>
 <CAFEp6-2QsKyZfEdSotVPhxVNOyRzncUphqLY5cRwHXGJiEbzuA@mail.gmail.com>
 <20261009001714.1078580-1-peter.hunt@opengear.com> <20261010171531.1659006-1-peter.hunt@opengear.com>
In-Reply-To: <20261010171531.1659006-1-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:15:14 +0200
X-Gm-Features: AclHuK86CgairrG5EnLwkN2ULrA7W0dmSP8kvp0UdVoDkSumbBYBiXSg3WaZPEY
Message-ID: <CAFEp6-0vuU2sy3pfgyprMMiLOaKCoZMQN=nHQ+dQR1ku9dbwkw@mail.gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Peter Hunt <peter.hunt@opengear.com>
Cc: Daniele Palmas <dnlplm@gmail.com>, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, mani@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX9ULe6emWrxO8
 BebZymx/guPrWw1ck5+fd2KyvpfE815Y8d3xmDFDPCP0PEsr9QEehYvprVX5uyoW/nNUQinOaXi
 QRPaHSpS5hHImZYG6B8uNdV1H1+U/oIuY7ObxUIV4RrL8ZG9ZLkAqGkM9f5y0q9EFGdV3mZssi8
 j/HOH3RM28fzHbymxMy2x6qSJMP281fUOCxIhUIa3BbpDSDyZkJKQ7DYImDvDUmH+IOECBtNbz1
 L5fs7waxVhqOBYvxuEQxqB9uAitNBISqURkwQVU0auoh/hrsXaYPktJtjs4wzwdB4nv7SEcI+ou
 eSOmtTcOS+59MH0tZ2EfFQTMMHfeytp4MT/WQ/BpGYmskPDsuyb7niEQDKQIy3Otu06KSn0QlPF
 q6RrZ0mTYsa6q23ShfJ/jxk1fZ+vCJv/2WSCNOpvUzqH+AhtsQf4EYSUy8wSOhzehyeWA2Dzzr2
 EJ0HDDdkEGPizkc9hlQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acccf64 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=t2vznHeBAAAA:8 a=088zT0Ob94ooJFCwm_YA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-GUID: p9afTQYUc_DCVyeQ7su7cFRhb6eKjWXH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX7EucK3GAgC8c
 m4ITvurf5F8Rcf3cIRqD1fc4tf0kGZW3JzMWk4lTfENHBxn0s4UwkTnopl8MOBgiXHNDgDd70En
 ixyO5F0oGUmKF3Pl3MUZ1dO/fsSxlnA=
X-Proofpoint-ORIG-GUID: p9afTQYUc_DCVyeQ7su7cFRhb6eKjWXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120048

Hi Peter,

On Sat, Oct 10, 2026 at 7:16=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> Hi Loic,
>
> A follow-up to my reply, as I overstated one point and would rather ask
> than argue on both. (Adding Daniele, as the first question touches his
> recent QCDM ioctl work.)
>
> On the AT-only check: I said QCDM has no DTR semantics, but I don't
> actually know that. I've only verified DTR/RTS on the AT (DUN) port of a
> Sierra EM9291. I don't know whether the DIAG channel behind QCDM ports
> honours DTR on these modems, or whether libqcdm relies on it now that
> QCDM ports have the TIOCM ioctls. So I see two options:
>
>   a) Keep it AT-only in all four places (open, close, removal, ioctl).
>   b) Call ->dtr_rts for any port with the TIOCM ioctls (AT and QCDM)
>      whenever the driver implements it, again in all four places, and
>      leave it to the driver to ignore ports where it doesn't apply.
>
> Which would you prefer? If you or Daniele know that QCDM/DIAG ports
> care about DTR, that would settle it for b).

I think we can go with option a) for now. The documentation I have
only references virtual RS-232 control signals for DUN, and we can
always revisit this later if additional use cases arise.

>
> On the locking: I agree the data_lock/ops_lock split is awkward, and
> it's this series that made the two locks interact. Most of the races
> found in earlier versions came from it. My only concern is the blocking
> write case I mentioned, so the options as I see them are:
>
>   a) Use only ops_lock, with the whole ioctl handler under a guard and
>      mutex_lock_interruptible() so a waiting ioctl can be interrupted,
>      accepting the wait behind a blocking write on rpmsg ports.
>   b) Keep data_lock for the termios/TIOCM state and take ops_lock,
>      interruptibly, only around the ->dtr_rts call. v9 already limits
>      that to when DTR or RTS actually changes.
>
> I'm happy to do either in v9, which do you prefer?

I would also lean toward option a). We may want more fine-grained
locking in the future, particularly given the blocking write path, but
I think the current approach is acceptable for now.

Regards,
Loic
