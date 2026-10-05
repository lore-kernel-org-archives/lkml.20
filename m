Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E190553446C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220791; cv=pass; b=t6Xm9PZ9WICMCT/fiOPTtZ8EtcYKNcKGrWfmSxKjuWLlPT8K+QCwcrdrEDW2jLigIRxHZXrPnoyPxgM23iQp8epAXKYJ+s9SmvdVDt0au6vkjlo5owREBRBs4IHiyddcbCfgtzBnoh+ixmBNEQRj8+qBBSoF9QLlLOapetdOTtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220791; c=relaxed/simple;
	bh=Iyy/EbW0PV9CgJFXeNSzqijmw9jKbQl0yvOdKn8dVN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOrZ2jBszJMjSy2Z3ghovZuSoyBF/cPIMlgKaFAnwz2Q4+GiL9B6FRH8FlfWXzv2vlCKFvL/YvGj2sGeQAAEG6OsGp4lWYcwxmaVhAVrFP9dL+DTbDyMgKyp3wlsR3n7t7otX87VLWld6Y0Krfl5Dkbw+PDYG6C++o62ZjDCnMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gE8JLIr7; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gE8JLIr7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1358053b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791220789; cv=none;
        d=google.com; s=arc-20260327;
        b=ahvyUII6ue85FkQguzxLSGQrnu0KupvK9wtuvBUPHgN7vyycsVP6CYgzCaZkvDRBrP
         dcGUgZBJ40MQcxsZHK5wrZF4el4G4ynjw18F7gK19xKMJcWtnr7vmOcvy3TtEkva/SJ8
         +iccAoZaT0FBCmL4gEyp7LIj4wk+Yx0oXhsKrxmZdlieJPnHiaCratMgQgW2BKRjA2vv
         a6P+/uBjK2WM/QO726M5688uBsK2FDHFf1TOm+Il0nPfGnplepCjEj3jaqeKbISZVVGZ
         YIHUDnYy5bsnu0gc9JvmSc3NHpr/dN5Tr0vMTnYAYAScX40vF4dYunaJbS/C0UfVWM0j
         0/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kZaUwiZFto6aopJ87je3gAd8sYajiTqXcqFYb3kLz6E=;
        fh=RsuAojef0/LVPTXomA2H62o7hq23qIXFudveeRgTPt4=;
        b=q1cF8bGfCHMESU+wNr24NyaPkwnm+nINS0RXFJ8Z2HfkjO37nYAsx/u3yTnbTOe3IB
         +QZKVUZKwdsUBGXFKp64lpLBR9hi9bSdD5TE3TXikiYz5InnYPbGnqR0xx8F1S1LcyZR
         EC5eOtLC3+HBiFlrdI51m3xEimSFJNxPdlhLjIRrXuYsK7iSr8ZIjXsH1qm3S1dvuuXh
         QpY6/e7JyUPOHj32ei4Q1fjRCELFVEHv7SvUNcrylEv/WyP47TAUvczWNmpvF/8gPwUi
         JvcnGkbweoRlK0ggpNyYwouQNpCb6p4fxO7VMAvNFW5Q5Uk9zfwF6bDl2MvidFVTjjCB
         mgGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220789; x=1791825589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZaUwiZFto6aopJ87je3gAd8sYajiTqXcqFYb3kLz6E=;
        b=gE8JLIr7W6DAIA2P/MDRVo2hmbxwnbtXbOE3gq2W5rAmpUVaJBoVaVt94axWAYNIrw
         x90UBYGBiEorg40G5/vkF3/Ui2+UEFjI5rsIlrBBcPFU/DCVKvLb3lCXf0FjRZbutzA4
         Rnv8+MKrtnkziCBFsmFRkAnq/FrDGrr4d7bxmnuGfATx6pj076+7qVqdw56HcC16t2WB
         I+eNJr3ikBf5QaXFPSxcTjFSKfjeu8ks1VVeut3gYUjnwVFgSUrV0rI18/ifY2rLt/MK
         MrZpuQpB85gJJdBs50UXgW0rOj3j78mzHK5jNGxKDgUDroqFwfN+RLAi+Tg/tb4mtDeU
         oM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220789; x=1791825589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZaUwiZFto6aopJ87je3gAd8sYajiTqXcqFYb3kLz6E=;
        b=QSlCqBuZzfGTYwyaJ+OngZURpWDjC36EEylMp+ESr5p9Jvw6Zbdv6Bnhxru9+eRYdW
         IvvMwXZylWFk8EXbVE74iGqVFzWsuhi/ilGHMql16Xb2kYTAJqlGvnJaRDYP8S0VGpVW
         uQW9FViJXo275i8fwpU5db+dyXdq6nLqXpCQ6S1PSmPBloXbMIiyWDvHXLWF9DKtHYYz
         1yYON9kl8tqY472ckh8c0jAU1UT5TUb3vh5ZBrmRf9V9WdzIC3lB7K6kzU2Ez1PZJTGy
         vgqcZdpxqbzqe9PsfSSBJNwgrj7rtBECus7SBbnM8zpHihtyq7SMTLZcZ5DyLA492Ywv
         6Yew==
X-Forwarded-Encrypted: i=1; AKwUvByPSs0bTSH2plN3m205SKb+uKcZAIWmQKE1KauBa151xBKYdVC5hnYjsY4nOq3h/0kIpvnVodL0pB/RUz0=@vger.kernel.org
X-Gm-Message-State: AFuF++llCHKJU6atoZKkM8+9XxZTA9eT4e5Ulp2UlMcSOr19UJGFBkeF
	rah0Usx7eQ5SYTeXDDUDHuZ+L0ObQbxyrxnTNQFDtkk1rjcSmBbzb/tRv0NrJ0ANPxR4VZ1itg3
	kYtxxpXU2D2unMR8j/trlY6PeYul8sWk=
X-Gm-Gg: AYBFou37Hpo/aOR6m2F5CnSF0mwqj1xOyrap2ZLy5pD9L4X6IlsH/Y8spp3/hHaL2bT
	rYw9iR4xvW2sidQiPf44I48hQur4xVLhi8Q//z5BTBVYYG7ITl/jUrLYJ6ivJCRb8xcQ8xQNQjo
	8AafvTUCo8Fyp/ybDkiRx+gTsNwAd5ebABOvOZoq8jZ3Ha1NpjlWC4vvErqYsvg9KT3MD3RtvHJ
	EKycgv3Z3CauQoqvdu9plxyNvYLy1QzqZHw9Ee6BcYlJMFPB/LvT9fgIsk3wUhqS7IiPnXDP9+3
	/vDJCZKf3MxY3mwosX71dDN6lGd8QvtOD+PwHJdWB5cY4mCI9Zwr+4L5ZMFE50TCfpmt+Ow4aRM
	3oJYpmjQA3j15laGW4lVoU+/23VMjUhAEXnUOBFaPIR7nITX2/CjMi9E=
X-Received: by 2002:a05:6a20:394a:b0:3dd:a197:edfb with SMTP id
 adf61e73a8af0-3e0d6cbdc69mr7529764637.74.1791220789033; Mon, 05 Oct 2026
 10:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930044611.204739-1-benquike@gmail.com> <20261005170632.GB83879@horms.kernel.org>
In-Reply-To: <20261005170632.GB83879@horms.kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 5 Oct 2026 13:19:37 -0400
X-Gm-Features: AclHuK-lyDkgT7D3dyZG9byu4tcMRkf70JRI3r14isoIqeQu9dgZ6L1lP-o_t_Y
Message-ID: <CADvbK_eAWQbGs7EUogG3kZDgpX_9bzrR-okU_6cAobcyp_SbtQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] sctp: copy zeroed stats to user in
 sctp_getsockopt_pr_streamstatus() when !streamoute
To: Simon Horman <horms@kernel.org>
Cc: Hui Peng <benquike@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vlad Yasevich <vyasevich@gmail.com>, Neil Horman <nhorman@tuxdriver.com>, linux-sctp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 1:06=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Wed, Sep 30, 2026 at 04:46:11AM +0000, Hui Peng wrote:
> > When an SCTP stream output extension structure (streamoute) has not yet
> > been allocated, sctp_getsockopt_pr_streamstatus() sets the local stack
> > variables params.sprstat_abandoned_unsent =3D 0 and
> > params.sprstat_abandoned_sent =3D 0, but then immediately jumps to 'out=
:',
> > bypassing copy_to_user(). As a result, when an uninitialized user buffe=
r
> > is passed to getsockopt(SCTP_PR_STREAM_STATUS), the kernel returns
> > success (0) without copying the zeroed stats back to user space, leavin=
g
> > uninitialized data in the user buffer.
> >
> > Refactor the !streamoute check into an if-else chain so that when
> > streamoute is NULL, params is zeroed and falls through to copy_to_user(=
),
> > copying the zeroed stats to user space and setting retval =3D 0 once be=
fore
> > returning.
> >
> > Tested in QEMU against Linux 7.3.0-rc3 using an uninitialized
> > sctp_prstatus user struct passed to getsockopt(SCTP_PR_STREAM_STATUS) o=
n a
> > freshly created stream: on the unfixed kernel the user struct contains
> > uninitialized stack garbage; whereas with this fix applied, getsockopt(=
)
> > copies zeroed stats into user space and returns 0.
> >
> > Fixes: 28b7eab0f910 ("sctp: add SCTP_PR_STREAM_STATUS getsockopt")
>
> The hash cited above does not seem to exist.
> I suggest that the appropriate fixes tag is as you had for v1:
>
> Fixes: 28b7eab0f910 ("sctp: add SCTP_PR_STREAM_STATUS getsockopt")
>
> Also, the patch should probably be targeted at net, again as you had for =
v1.
> I realised that Paolo suggested net-next, without a Fixes tag. But I
> believe the premise of that suggestion was that he felt this was not a bu=
g fix.
> However, Xin responded stating he thought it was, and I expect that carri=
es,
> especially when combined with the updated patch description you have
> supplied in v2.
>
> Please treat the above as FYI at this point.
> I do not expect a repost is required at this time.
>
Thanks Simon,

Yes, the fixes tag should be the one in v1:

Fixes: f952be79cebd ("sctp: introduce struct sctp_stream_out_ext")

> > Cc: stable@vger.kernel.org
> > Reviewed-by: Xin Long <lucien.xin@gmail.com>
> > Assisted-by: LLM
> > Signed-off-by: Hui Peng <benquike@gmail.com>
> > ---
> > Changes in v2:
> > - Re-target subject tag to [PATCH net-next v2].
> > - Remove redundant retval =3D 0 assignment in !streamoute block and fal=
l
> >   through to copy_to_user() as suggested by Paolo Abeni and Xin Long.
>
> ...
