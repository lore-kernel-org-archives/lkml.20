Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50DD2E8B64
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419983; cv=pass; b=AbBmnARi7pspnLRAk0Z33TfErGGsV2LvdU8553/KKxCc0iCWWAyPmHsA5ksBNDfdejDdfnvHY410QP8XEQpVcTQhBL59a2GqChx4G1cuKXWMqAIH9SOwhCoYS4dXk16RGId1msiNaLDlOghGmmh3tEpuWuxu8c5WweeghoeR9Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419983; c=relaxed/simple;
	bh=mTUwZrU0fa1BpQL8pMtLVF+MklgAx+cCyMl43qVtU5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEYaUzGSAeg/Cg7DHY+eH5u8cgVcZimKtaPTkymiyRgP+RIkVn3Py5k3e3Xqgjq07c3kwOyvabViMgBTa7kKfXYYdVYVeAi3y8WlFPm2c/em+0hWK8eKNYY6qB0MHwYCxE8UnlKO8BdUZfzUQ7HMRsUFjYJijGfrQdS/i3zyUcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=f2dDbm/G; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="f2dDbm/G"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a5d683b4f7so297134a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788419980; cv=none;
        d=google.com; s=arc-20260327;
        b=psCEOEN64S+iBTuwBg1UpGtteGz1krXhU7CTVxiTAnPsQCgwa2LUGSmY8N51DvAtMD
         UdRJPCHwRVCbprwaHT5gQWX0htpvpvgEassi05XHbvbtUId+G8+wHvfEdAyg6cjNSlws
         0kxZgZi9IA0Ldbba0f2sQX52YVIzfurW9TbxNqS5wkXesJbxmVgSH33AX7Okn1IDDfDX
         meaTz2JjnNx4MMoqY6OuXHdBfx6v3dRjXxGejAiW25KC7r+a0yEonHoDiJyR4I79peCq
         cVCOnU9sELluge9dgjTo8vOekIdckXASZ+7A40QFx1gAzlsaT12U5irvY5VGIyDP/SmD
         Rcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mTUwZrU0fa1BpQL8pMtLVF+MklgAx+cCyMl43qVtU5o=;
        fh=vxtF2lFibPTHz41EOjXKoDH4RK8iwX049xpKJOR4A6A=;
        b=hHrN2rYaG714MCDrk4zyr9Ci90fOKhebE6B1sv8O1saTd3psIGA1PoszsgPBRLU+IM
         fWKUDy6jOUp7GCfNDGupoxLZ9WLvy3bMRhdOxq5/HT36u5DelUPZcNlmcRKlWzQ3EjBQ
         Nf2h2PtaEYkSEEGJoOZiKp45YMi/JZ/tewLkJNJk6opSVZ2aTXSONuIslx2+RIZbS98y
         HB3TByAILulVuKqyQetZRns3Va7e2PYcCZa8/XIAFO69amdXHYjsOkK8dEU2Mxz2ICMk
         jop6D0mvBipFUkqizLG8ggO1QkRlydxAPwQPUjdsdrzev0efidL88ppsMMHkjgbivIaS
         atHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1788419980; x=1789024780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mTUwZrU0fa1BpQL8pMtLVF+MklgAx+cCyMl43qVtU5o=;
        b=f2dDbm/G4whbujrQi148xF9jXE8FNSVMXCt7OR9iTBDmGUmu3HMpL29LYuKhQhvdX+
         a44AISJTlz6VhTA5PcTEHs9wb95NVANHA2qz/UygTrv73WMgHYKRDMbCCy74Q5GqIndv
         MK5Y5zK9Ltk6Hi7MnBTiqaGUztVaRVQ7umAZaRYYa8ahKu3+xhvpHn8a7mwfvaZjSNrH
         Oh8rh1GAg+4Pzmbi0QcHzJypwBAhaHP+71idGvh48KrdyCTSypKRh/OYD/d5H3RUmWUq
         NTf9PDSW1VzOCqSwpl8TZX+zgHlhC4KQcsASXMSp2HTKqoA2daoNi/iIqbR3Z0zn8o9C
         liBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419980; x=1789024780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTUwZrU0fa1BpQL8pMtLVF+MklgAx+cCyMl43qVtU5o=;
        b=Q79HS2ExzdmmiPsQ/NEgLm22LWjE5q6madjK6IJEFzMiMzSgUoNRG7A4iKdJvJFAy6
         +Hzn0lS5FLjLnA+5lAELD6PVxLx6wb+U2w46VVGc3R0SR+3SSIrnAKY7hFvNWBiA+cPl
         YsIiOzfdZnaE9yl82+YnsL3WdW4dtrpXyX8aj07SeOXixs2Y5SLS6Cznx7HFuMhlxKl6
         bZNe4iC6LbCFzYAXXfJWhO/HW3XXwlSbQ1nKY/T9X8H+1GBXRvMSHreNDXgt2TdvXBwu
         u/ZBzubSML8O15u9SqmA3A924L8FzUSJ4lG7RrLcr8Od6q+az1z3UR69h77L7RcXYtGo
         0dlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBw4HOMV6FrTf/BbzW3+RTT48xVf7F5DnAX84CrXTR9RbtVGg90IksPvmzfq2KONDi3TWuH5bCPoZSFns=@vger.kernel.org
X-Gm-Message-State: AFuF++mHbGUr+mNisIXbY9IOroByzBMgdDTDuNruzGrtG3a3/v9bBLn7
	HEQ8AhXT9rr1omnmQAtDIC8sCaOLziBV1m6JWMBr74Ca561eeJ9pFCDRQfE7e3nkLIem5dJt9Fk
	SK0gdQX5ap924k0aCkq21ttqjFVowVYEGT0pAimOtbA==
X-Gm-Gg: AYBFou2NybthvzlImmKMWSiDH5Eq9otfDLG6vORlvu5/8vrmUSkVBX0R30zjwSavwKq
	zel94RKDh2Xwii4tXVyE1cgh9NdDyJhG876RI/dTZhKqmKYdcG3s+wyeedPtRqcwLdcaIf71Otu
	G2ULCws5RF4x+jWYov+9mqV6R7HPRWM4BBxsrZYjtsdbxZa+wPL/76kTnOJoaj9qrGXJsJiwq9H
	gw5uSzeWHLPzhg3h5nPgAZ1YyOeVRzEk8jC3jo3YRF+qBNeSappbVkDktp1p0gM674OJqdixueL
	w113CkTEtqGd9G8fYCtbsRHAzNOiWBxVd0gllTbSn7Fd
X-Received: by 2002:a05:6402:13d1:b0:6a6:32f9:d7d1 with SMTP id
 4fb4d7f45d1cf-6a682b02740mr3563571a12.3.1788419979857; Thu, 03 Sep 2026
 00:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-rdma-rtrs-clt-cq-pool-leak-v1-1-b169434fd3df@proton.me>
 <20260902162518.GW24140@unreal> <CAMGffEmz_QSy2TLM5OBQ5GUaOiRozkLyuTNOXV8f9CnbvhPYSQ@mail.gmail.com>
 <ANOSEdInjxoti993P_wPWGuTPEEr-eZDjuLNMkXhG0yW63ECGVftgiFWetVMMKjLBrQc6dUiZtThzpFuEvDy4hqbNjooSjKeY2UW9qR7pk0=@proton.me>
In-Reply-To: <ANOSEdInjxoti993P_wPWGuTPEEr-eZDjuLNMkXhG0yW63ECGVftgiFWetVMMKjLBrQc6dUiZtThzpFuEvDy4hqbNjooSjKeY2UW9qR7pk0=@proton.me>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Thu, 3 Sep 2026 09:19:28 +0200
X-Gm-Features: AcwNN1WLR6sVn8LWmUEY-1AZlMCl9kDHNCc8_QEeroxJImRuBFKSXzx2kFxyB4U
Message-ID: <CAMGffEmj1qXRM8aR5ti9zzV2wQGnY+NSL5noqb8dSYYxNoFUGg@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs-clt: Fix CQ pool leak when connect is interrupted
To: quanyeyang <quanyeyang@proton.me>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+d396918a29afb8543e1c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:06=E2=80=AFAM quanyeyang <quanyeyang@proton.me> wr=
ote:
>
> On Thursday, September 3rd, 2026 at AM 12:48, Jinpu Wang <jinpu.wang@clou=
d.ionos.com> wrote:
>
> > Hi Leon, hi Quanye,
> >
> > I had a look at the report. The syzbot bug seems to be triggered with
> > smbdirect (ib_dev[syz2] removed), so I'm not sure how this change in
> > RTRS client would fix that issue.
>
> Hi Jinpu,
>
> The smbdirect line is from ib_client->remove() during disable_device(),
> which always runs before ib_cq_pool_cleanup(). smbdirect just logs that
> the IB device is going away; it does not use ib_cq_pool_get().
>
> rtrs is not an ib_client, so it does not appear in that remove loop.
> The leftover cqe_used comes from rtrs-clt borrowing pool credits in
> ADDR_RESOLVED and then dropping the con without PUT, which we hit
> locally with rnbd-client only (no smbdirect traffic): map_device with
> path=3Dip:127.0.0.1, interrupt create_cm(), then rdma link delete.
>
> The same "ib_dev[...] removed" line shows up in that repro right before
> the WARN, for the same reason it shows up on syzbot.
>
> Thanks,
> Quanye
>
> >
> > Thanks,
> > Jinpu
>
>
Hi Quanye,

Thanks for the detailed explanation. That makes sense now.

The patch looks good to me:

Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>

Thanks,
