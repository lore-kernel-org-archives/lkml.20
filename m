Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A02F7F14
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788071145; cv=pass; b=MD2ZwjxYTd1a9e9Rf0cllaO/QGygCxbTeFfAGI2qCWX1BPpIOpdFSTPxBJyfCQIPC5I+WD3RXaPJs43Q/EwzNnn0nbKGwLCNjmy9IvV1QBnPKKdsNYXn6bB4Ujaw+jHD3HqwS4s6l/uBGFNnOFMvtHd5Ltvev8jj9hX0eY4Yi4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788071145; c=relaxed/simple;
	bh=GalG5KeewwDo5F/yvEnnWSTdgiJ/XKsm/a64IaDoohc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZlqZYrypKfGaFrXmY+6fk58s5bIpP676MDnaJQ8bk5/+33I44IQhZ7696Iv3tf16IRqh/EXjNuC+SA8Bn2EC3bcWaOIGXKKnMnRE0XrNweOZ157tAvMYOlvvOLEqAItAvjbZN34w9uR1Zc+NKxcvsZub3aLSbFpYEvmSJgTIxqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpQOb0eg; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpQOb0eg"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66e3d262d43so625145d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788071143; cv=none;
        d=google.com; s=arc-20260327;
        b=HvNWmhYG6XLeNKam81nEhfDELTJZFfNfcjBRdEfwyxfUqiYV1C6gqP6l3+sq7yQAS6
         I8wS4KKZlX6fPLrWQREYDg/UjvAQckka8ArzxjRcpXRbETrwcm0a8BS8q2DIZrmeJfGc
         iLrZYnbVPQ+gykwhk0la/rxdoa55Zd9IvVymUvtbDL7N7oT4L/Pz2ZHf4eSgCnGuCae5
         sgTehsxXlNroLTdF52Z7Dqn8YvoV5ni0uKBVjXtbbdqjTafKqb9mhujQJBEL6vdV+l57
         gaykWzAoAv8NTZcaUBSyILHKjtgaJfviWsozY7pQOsh0LpDgaIMgJwV9CiI769vHBNls
         5afQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ie2zZl8YsHAeQXHgNP1pjeAs7NQ+FFglXIo7DLINxR8=;
        fh=DVxasMRoByR3TCWM0Q5Mg9bLfoSbJAi0REcpBdzIpvg=;
        b=gyfEVcV3SgeElWmsOx865qOB6ydd3Ki9STbIf4p4n65M64lHFfN2W8fzpBhwZnAz+H
         IvVsthIQ/EkYA9YYhy1E+uwokKlWvqfSwlPks1fHoL6cC930r54ZalsVsIMINUxd/3Eo
         Q0FI2qHfDhytPdtB7eegdTpddSC0rmhRsqj61otzeyKQBshmM3gJeI5EOIZmFnb8bcuH
         6FmvqH1Vp1SVFXiRoC5MXP8CTkVYEwmdZnQYtHm6qvhyIoJgxE+PzWf0q2NM5cbJ/ICA
         /5GuEzjiBXP14laMVuyf+9d48ZZpHb9YWMeZ4en2un3smwmXq8HKvNDtn4/pQCOjr5te
         V6pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788071143; x=1788675943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ie2zZl8YsHAeQXHgNP1pjeAs7NQ+FFglXIo7DLINxR8=;
        b=PpQOb0eg2Gla59JRcMDKsW5dzbrkjlT0LCsL8mbWFGXTCIqO5ZXs6+MSNQgmRkl5Ep
         tVlmrk2rZucczL42ZdKfLCSYD/K8cya4PuGKPvulQecTdM5ftNbh98xylPln093PHjQv
         m/o2ctNWXfK1a0a204PLSD7On2HIIPDNvn76X2tdx4bbazlq1Kv+0IRw1UNw2bc7PEMN
         Z0UHdKYaRRtocYddTl6KCu8A4Dd25ee5UyUjGFBBF1xqG+KKmAbKbaKApecBliMRfD1I
         NQZkigV5Z/b6mt8TAvuU0wDLKzilxXpkXJWzI/Iv+FDMxVvkczH/tZkdHk8YchEJ6jTf
         oGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788071143; x=1788675943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ie2zZl8YsHAeQXHgNP1pjeAs7NQ+FFglXIo7DLINxR8=;
        b=p7sgNTxeoc2eK9L/sKCXI3mB0ZYdKXgbMpv0/SVvV6/mwjzaMAMDGGJ4jtWhDX/nIL
         J9yovjRu7KzFL4Zxj7JvF76My5BoGVLRECEpgUlx/s/DzKXp3qR9U+jsm4re6gd2+nT5
         XEOYWC3LIMlOm5Gr+1LkV4hYeGwDmVMgWgRJEOr2dKdhi+L+pqifO/7ApbHIW3bd0h/t
         bpGU7RwKtCp+/lWkMBHoB1eESt/34w7TnW0iek8YisnUCKC+saBOZLfe2AXf9oWschGD
         NfJIUAL/K7lvQmipegU7azMdTc81gncLUfx61Jge3uy0Lj92804CkI8yX6P5mPtjqAIc
         riog==
X-Forwarded-Encrypted: i=1; AKwUvBzcdAWDwVuy8WqHt7yiF463HD1xDYkLwI6B8KcTJCPVPQaaTEjy6QVKwk+KAsRF6AsuQi37i+IWx4P8gT8=@vger.kernel.org
X-Gm-Message-State: AFuF++kaJuUzHhwjVAS1bKtILbsf+TiXDQcrx9B2GEoZ3n7Ywhi+zpu1
	WlkpdEoyxorA1+u7Zarx87s64Pc4QZ9ZcZ58BCZBcxvLvsNg409H0nUuWT5cGHLjS14gE3tL99S
	HsTddu8TzVqkuoT42sPfB4nG9TNatsv0=
X-Gm-Gg: AYBFou0B7iABR1J8SMw52zl2gUObuT4UvJUwuXfkxx0IBDP7Cgaku4CuLoT/oKqYhbf
	mN/vot9vCa1rtx4fkM91PFR9T31LiSiDNFd7T2+/yjL1yWTCOk4eOdZOUJC/ZtZkLN8ohsSUUMd
	pgwMJbaXH00VsBTDfS0rpz3t5C5em7unaxE793J/KquLXJn7IQXuBf8QeG0RR4W2gXkvVeTOYs1
	o9dR8tHp6RChGM7y4H6aDL8YQ/0YnA7aFWtdLgSIo8df91swnG3EZskpyjrCGq46TDaHMP7bZc3
	buPru6qIOkt1MPn/46l+xNSwoqXJYPlcC5RIbb0jwN+VY6tkpVF6DQv1RJJx43KwfLTrrHJQcK0
	ouTEC2nYYyPCd56iXQesRLNJS+qXsF9nA9Q==
X-Received: by 2002:a05:690e:480b:b0:66e:61be:b280 with SMTP id
 956f58d0204a3-66e61beb351mr919322d50.48.1788071143285; Sat, 29 Aug 2026
 23:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813064902.367504-1-kartikey406@gmail.com>
In-Reply-To: <20260813064902.367504-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 30 Aug 2026 11:55:31 +0530
X-Gm-Features: AcwNN1Uz1IASuABwBGrNzT8vqscd8g3KsyTVjcnjYQteHxWUUv-5lbfRLHAaf4c
Message-ID: <CADhLXY4YXGWUi8JcfdYMJ4HhKMKS2RLg2WvnZnku_XK45m4-fQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Guard against NULL driver_data in i915_pci_probe()
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
	rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com, 
	simona@ffwll.ch, krzysztof.karas@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:19=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> pci_match_device() can return the dummy pci_device_id_any entry
> when a device is force-bound via sysfs driver_override, in which
> case ->driver_data is unset (NULL). i915_pci_probe() casts it to
> struct intel_device_info * unconditionally and dereferences
> intel_info->require_force_probe, causing a NULL-ptr-deref.
>
> Reported-by: syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Ddb96c5ff032f4292a8dc
> Tested-by: syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v2: Drop Fixes tag, this isn't a regression from a single commit -
>     the unconditional dereference of ->driver_data has always assumed
>     it points into a MODULE_DEVICE_TABLE()-backed entry, an assumption
>     broken by the generic driver_override fallback path, not by any
>     i915-specific change. Add Cc: stable instead. (Krzysztof, Jani)
> ---
>  drivers/gpu/drm/i915/i915_pci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index 82415af47d54..2f03f95945f1 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -958,6 +958,9 @@ static int i915_pci_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>                 (struct intel_device_info *) ent->driver_data;
>         int err;
>
> +       if (!intel_info)
> +               return -ENODEV;
> +
>         if (intel_info->require_force_probe && !id_forced(pdev->device)) =
{
>                 dev_info(&pdev->dev,
>                          "Your graphics device %04x is not properly suppo=
rted by i915 in this\n"
> --
> 2.43.0
>

Gente Reminder. Let me know the status of this patch .

Thanks

Deepanshu
