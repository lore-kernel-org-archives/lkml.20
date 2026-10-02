Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24929498904
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946469; cv=none; b=Hx7Xv2vHwboS/GPFAC8r1GPMaIo22it7tSt1HgXKjopN9pb9b4TnGpfueTqgokJ0VvH6PHLJhnDhM65KhqtvkjE8jnjY1CbFX4ldJPirIuHQku1bzZ9ZvDXqCw9xMp4fnZsfNec3lT3dfvUSYrX6/KxpPVYpJ3/x1Dg554KzqP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946469; c=relaxed/simple;
	bh=rRqSxYBVDs5G95Y3/oR5AALYIw2h3V5XgBraBQoZiHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGvVA+jvy3BaLZ/Lq1YxedRTRvPceEqap9NcIkTT8ISQrmUmBdTwYWKG5ttlLRs0u2J2jAy/RI9x71NxabR2VJ2sy6V4DCmc9sflW39KiiV3AdGu4X5CcV0WlfAdwZit49n7dKZuEXlZ9+GLjAwjn2/95l6VNArR1pA/uFxFjDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+1gVFjP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+1gVFjP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69341F00893
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790946456;
	bh=rRqSxYBVDs5G95Y3/oR5AALYIw2h3V5XgBraBQoZiHs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M+1gVFjPcuXIRHNDlo0YDSbLrzSXziQmIRNUXvdsDPMu/NxlLC/fOQytAhp2xg9ci
	 /bs2XIDtm5Vxoi0Q8zN3VRPXadymgOdojBdXLV5Aoqk1H8ohjtmxJfiSK9hTUXwQC2
	 IsI9sQKTMtniC/1kla8fbPfqqM9CIwaWpf8a9vy2LHMzKDyuq2VQe6R2GPvC971j4T
	 Q7TughDWAUNnhZFiWBunli38z+LaIQ0e4gAKLPmRzyy/MtkmKV3IFOJo2tqhtxIvRB
	 M2ozR3qHRZAnpCB1THUdM923rwyhw0PjLovg3HK9H6W8/+brRsYJ7BU+mSzGuaqKrY
	 EtOKScSak87cQ==
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3453dd0dso3044766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:07:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvVIevmC1McMm1IpjWLSj9VVss6htrHIZmHCjkTAI5EYk0H9TXs8jd14jC/g12/xc9CGHeYmCcsRowgNY=@vger.kernel.org
X-Gm-Message-State: AFuF++mYGg8fKSnaCWeRd40JlvipZq+hnpgoB1IZQ7RIgbYRma0NMwd+
	eTHYxKcVzVene6+mTv3WOQIh311RSoaw8l6a6LTtAnDRojLEmiRUeeAVCeqrb0CPi6P4WIefFsb
	KGnM2mZUEZy+ztOA3f/72C3Ne9vVYJ3s=
X-Received: by 2002:a17:907:6eac:b0:c2d:f050:ad4a with SMTP id
 a640c23a62f3a-c2e4a8ba934mr222524866b.5.1790946451229; Fri, 02 Oct 2026
 06:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930183758.32342-1-3058704216@qq.com> <tencent_464A86FF7A38FD3620EBF1C6062745316307@qq.com>
In-Reply-To: <tencent_464A86FF7A38FD3620EBF1C6062745316307@qq.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 2 Oct 2026 22:07:18 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-fV0zP0wM+zcKtMcQv6DtMuZ9rwDC+zr0Q3KiktycXSg@mail.gmail.com>
X-Gm-Features: AclHuK987g3Vt_LWQapWiNtYD7Ot6aXK1r7jw7bgFxA4oWETAGLY1lxDqDJS46I
Message-ID: <CAKYAXd-fV0zP0wM+zcKtMcQv6DtMuZ9rwDC+zr0Q3KiktycXSg@mail.gmail.com>
Subject: Re: [PATCH v2] ksmbd: use clear_and_wake_up_bit() directly
To: Daijiamu <3058704216@qq.com>
Cc: sergey.senozhatsky@gmail.com, tom@talpey.com, 
	chenxiaosong@chenxiaosong.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:06=E2=80=AFAM Daijiamu <3058704216@qq.com> wrote:
>
> clear_and_wake_up_bit() was introduced by commit 8236b0ae31c8 ("bdi:
> wake up concurrent wb_shutdown() callers.") to replace the open-coded
> clear_bit_unlock() + smp_mb__after_atomic() + wake_up_bit() sequence.
>
> Replace the sequence and drop the now-trivial wake_up_oplock_break()
> wrapper, calling the helper directly at each call site.
>
> Suggested-by: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
> Signed-off-by: Daijiamu <3058704216@qq.com>
Applied it to #ksmbd-for-next.
Thanks!
