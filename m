Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E03FC5D3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565914; cv=pass; b=TPq/JoOuOmtDcyEjcBHWSSO0ZKjDfPl2VgdDLB8cCFRd/lTZVhwhiY87fTFQZhToNIg0CCv0jSUtR+DijxHprTGRvqe8djzWEH/xpc9SRNY39JDQ+Hod7UqsZ14qvVqlesLif/GMe1LSKC+uR4fCB+4szap2Fnhj/kWnComGqhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565914; c=relaxed/simple;
	bh=VxVVFUrZNYmDxtHauKu16hNl8SquobegkBvEi2oGCpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2HWG3lhF7sNltIs6fSqYneBh1/fxio3qqPj3LeTMuh+74TGrJh5kz32jMqQL2fx+IqQUCe6X4XRxq4Y7/W0No1Af8d9MpApwRbz2Eu9by8IFl3ykecJ1bcHnfEg6T/8pAYryKl5PdS3BdG4qYF8x3k+SJdbqLh/QlMEXRXo7Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goxpIBE3; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goxpIBE3"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff163f65so7277351fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789565886; cv=none;
        d=google.com; s=arc-20260327;
        b=RghepzOTYJOFuceT0CGZhBiOIm10GoOs7JQd2XmRkOkRuIF91f9fVKuf89jELABugq
         r+EzNOrysi2mon0U+8h3M1bmUripyyP/E88HrXfOjewZUvgN61QgD+bHjt5uhPPl7V3j
         1071H2rekLPFuNS1mCS/6NFDYsQ0hjWCfZ3MwJ3NlSoOK6CN2Kx5cNbDes87jsRZH+dn
         qzTLTTQHV5aSoj4BMv6ZQzWHP1IeR0YU6eLdybgCXbZGS5dANCF5rGj3cdbxJy3YdGaN
         R9uApvUUENcaxX46DphGrkWq7hAemGutDnlWvg0aYhvQo8iHK1CxMugNzhIP6/whjvxJ
         Dorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0teu7xp+BkcAacjp7xSCRSnLwGlM0PRADY07dogivo=;
        fh=tQWU+7PNd5TxBRVmebQNZNGklfIVvAnXOtHelbfNj+A=;
        b=A7Zrq0/wfyHF4AOpQmlJVwb9pMeoE266VqpVv2UTpWq5YdbNLv3mMhmbAfYpjBTMOi
         qLa27rsHZSHDqT9dHL804ZFCkf6GI+YYuDkdZssl2qISL3OPLNS9PKfoZcLISDD7kSGe
         WwUi1Ic9Ec9je9UReMQMtGqMi1UOY8xllb8fgYNYcBOZpTVMDuZKo4JzwZ+lU7z1gi7g
         8A535MhZACj8iaUGkYUiRRKYEV6p3wQF1PUaaesAus3SEZJ7OtrnCl0C2LzWD5zlYTM7
         RwvB8MzOHLSXobzR7a5GMo/zrtAVReYhBpBUCLaqgA/EFl07KwqvAZm7pAY9oeyCU3rX
         x9jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565886; x=1790170686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0teu7xp+BkcAacjp7xSCRSnLwGlM0PRADY07dogivo=;
        b=goxpIBE3+1Wl7dZugsuyulcfdqNX5EMpXYHKkEWt9MeUBHSgVmx8J8Gwhi9M4Nrurj
         pYJ3GWfBLKeRAVTKNaibMrgyQbLcBIoiMMvNx9cZ1NtgXWPupXI7Xz7q4Fo9wvomgEk5
         agakTinOSanKjRGFQs5e++o/8UCLmlFznB4xQ6dixJJiSu0k3RaYnG27iqGpqvFUZfOA
         94+MVwhBxTCa5DLk/EOD/O9ygL/+Wm6smrKC8ydLkw8zbzVZNJgBe7fAfF+M4YCwyIdK
         rk2G9tdCCX3u0h5JSFrfVzJ0P3AA96pINaSWDevEZo2k/iM1AJrfkOOjDjy2wWmqssTa
         V4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565886; x=1790170686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0teu7xp+BkcAacjp7xSCRSnLwGlM0PRADY07dogivo=;
        b=QIq0LkPafRKwgxZSvF/ckR7VBSQ+VEp3xqrSD/WVHK9RStz5MwBhg1GRWsP3AGGA1R
         OpeSxw0SS2DLm2jslMeNT3vPVLoyJb5918RNgcO43JSVCuEG/xLQ8wHbF5DU/oKppv6+
         EBBt39bOujzSn2wVsieSyKqZ53PA0FLlW1yRljt5eAqwjWIOR2M0x4cd2c39g7fnZdf1
         aTTNypKQi9mJL8q/rX+Gpb8wkEDM9dkLFUbgm284eMd2pOu/el4fZQ97hIN00hyuxKZx
         e64ghsHfZq8+S8Id6CZwI8hw/gKWMAS7on/AI4LXikeTVFSUcuNCDvVfT+SywZubL++7
         aQfA==
X-Forwarded-Encrypted: i=1; AKwUvBy2ZyHij7m4KkZX/ezd2KaAZzW8swKX0Ak9tOTk1Bc5G/uDIhcn2Zfi39VtOS8J1wBNO+LrtlruFRA3o5s=@vger.kernel.org
X-Gm-Message-State: AFuF++kMdisIYOKhGNgZDew1NsiaJXj/zYGlwcTiaBUpv1TbxoN7Maci
	zJBya/oR0AE89HnH7K9JCMoIoggs3PAMneVEu7lx/lpLQOUbNpdOp+VmiAfy9glCOhhKLL1yKY+
	tpA3XOyhS3jXr/QejcEWArFKUrKUDbhI=
X-Gm-Gg: AYBFou3A7++uRMEwJDOaB76Kz8erJf362msstV94cvzg3wNWq7HlFyVRrLG5gNlFysx
	uw9IqGPZFZhi4KRZdIGcV/RipOE9sHulZlX3VDoosLzcfCcmdS7zaTInyWf2HYyD7Sh4jBe/dO5
	JpIoQ21bXUG53BW/CNeaPbFeaKgZMLgdmoLN0p4h8rEw+WIA3Ake8zEDQApU5hxd+/QQFVt/qU0
	WBfNwGFqdwo1MfrmYcg70UluWVlOWdY8raD+osfHXjUHwlU4tZWFxBMP4wpwt7KEtq4eGA3jJYW
	d97eVHmCQ/db7zA8mpEZYWx3K6XeKyUHNy8nu/6f0Bmx9TNYH5B1c3g3
X-Received: by 2002:a2e:a7ca:0:b0:3a3:2a41:c0c4 with SMTP id
 38308e7fff4ca-3a5dca30ebemr5052221fa.14.1789565885882; Wed, 16 Sep 2026
 06:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105032112.1156359-1-dolinux.peng@gmail.com>
 <483ad434-4512-442e-ae6c-4108d5af5e49@gmail.com> <ea36a1e2-2940-4385-9b1d-fb197f1b562a@paulmck-laptop>
In-Reply-To: <ea36a1e2-2940-4385-9b1d-fb197f1b562a@paulmck-laptop>
From: Donglin Peng <dolinux.peng@gmail.com>
Date: Wed, 16 Sep 2026 21:37:50 +0800
X-Gm-Features: AcwNN1XGYkOqKrLXqV4AV69JFjHJ2lwKLnzFZ5CH-17qpLfCXzKgAHHJYjVSwSg
Message-ID: <CAErzpms_CF5V+3T0i=iG9p7Q5uQS1287whvOe9iXhFkAGvE90w@mail.gmail.com>
Subject: Re: [PATCH v2] rcu: Align stall warning 'idle=' output with documentation
To: paulmck@kernel.org
Cc: joelagnelf@nvidia.com, frederic@kernel.org, neeraj.upadhyay@kernel.org, 
	qiang.zhang@linux.dev, rostedt@goodmis.org, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Donglin Peng <pengdonglin@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 12:06=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> On Fri, Sep 04, 2026 at 08:24:05PM +0800, Peng Donglin wrote:
> > On 1/5/26 11:21, Donglin Peng wrote:
> > > From: Donglin Peng <pengdonglin@xiaomi.com>
> > >
> > > The RCU stall warning message includes an "idle=3D" field to indicate
> > > the dyntick-idle state of a CPU. According to Documentation/RCU/stall=
warn.rst,
> > > the hexadecimal number before the first '/' represents the low-order =
16
> > > bits of the dynticks counter. An even value denotes that the CPU is i=
n
> > > dyntick-idle mode, while an odd value indicates otherwise.
> > >
> > > This was valid until commit 171476775d32 ("context_tracking: Convert =
state to atomic_t"),
> > > which merged the context-tracking state and dynticks counter into a
> > > single atomic variable. In the new layout, the dynticks counter occup=
ies
> > > the higher bits starting from CT_RCU_WATCHING_START.
> > >
> > > However, the current stall warning code prints the value from
> > > `ct_rcu_watching_cpu()`, which returns `atomic_read(&ct->state) &
> > > CT_RCU_WATCHING_MASK`. This masks out (clears) the lower state bits,
> > > resulting in a value that is always even. This obscures the CPU's tru=
e
> > > idle state and makes the output inconsistent with the documentation.
> > >
> > > To restore consistency between the code's output and the documentatio=
n,
> > > shift the atomic value right by CT_RCU_WATCHING_START bits before pri=
nting.
> > > This extracts and displays only the relevant dynticks counter portion=
,
> > > allowing the parity (even/odd) to correctly reflect the CPU's dyntick=
-idle
> > > state.
> > >
> > > Fixes: 171476775d32 ("context_tracking: Convert state to atomic_t")
> > > Signed-off-by: Donglin Peng <pengdonglin@xiaomi.com>
> > > Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> > > ---
> > > v2:
> > >   - Use CT_RCU_WATCHING_START to replace ilog2(CT_RCU_WATCHING) to cl=
ean
> > >     up the code, thanks to Zqiang.
> > >   - Clarify the commit message.
> > > ---
> > >   kernel/rcu/tree_stall.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
> > > index b67532cb8770..fd9d7fd6e17c 100644
> > > --- a/kernel/rcu/tree_stall.h
> > > +++ b/kernel/rcu/tree_stall.h
> > > @@ -555,7 +555,7 @@ static void print_cpu_stall_info(int cpu)
> > >                     rdp->rcu_iw_pending ? (int)min(delta, 9UL) + '0' =
:
> > >                             "!."[!delta],
> > >            ticks_value, ticks_title,
> > > -          ct_rcu_watching_cpu(cpu) & 0xffff,
> > > +          (ct_rcu_watching_cpu(cpu) >> CT_RCU_WATCHING_START) & 0xff=
ff,
> > >            ct_nesting_cpu(cpu), ct_nmi_nesting_cpu(cpu),
> > >            rdp->softirq_snap, kstat_softirqs_cpu(RCU_SOFTIRQ, cpu),
> > >            data_race(rcu_state.n_force_qs) - rcu_state.n_force_qs_gps=
tart,
> >
> > Gentle ping on this patch. Thanks!
>
> The advantage of the current code is that the CT_STATE_KERNEL,
> CT_STATE_IDLE, CT_STATE_USER, and CT_STATE_GUEST information is visible
> in the lower two bits of that hex number.
>
> Now, if you wanted to print that information symbolically and then
> shift down the counter, that might well be a valuable improvement.
> Given corresponding updates to stallwarn.rst, of course.

Thanks, that makes sense. I'll print the state symbolically, shift down
the counter, update stallwarn.rst accordingly, and send a v3.

>
> Or am I missing something subtle here?
>
>                                                         Thanx, Paul
