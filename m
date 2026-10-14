Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F6379EE7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970449; cv=pass; b=joNn3VCyesy2cNyT3laTqXXA1hxlg9InmZDXJUn5r3I6fza40YWk9gIU9CbDq1gHBWL+TdWiIzH8ZMNR/cNLkPZn/OdgkWIb6yM/8hdrqHf3fTq97HvNBpg3iv69PPIaQTfpXVO1IdBPJIRw6zhw0vUUtr12wlUuEBMkZsXFBHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970449; c=relaxed/simple;
	bh=ymaPUYargcs8FQDr+6bZ3PYP5DTi+WnlwiWAqpq10bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCEclKgFTVknlWaYjoX0zj0HeR2/AOewp2/L6/fV5L6D/nxsKHK0sm6wafRoVvVBQ/Nld+LRg3uXAbrvHV8lPpacmxYF9IU35QhojuOAW5lgbadrO7/bjW4O9vtQeSH5dd/rVDdGPoJzzN4t8IXQzEoAA7Oc0wghjzpZr2d6DOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjHJJDK4; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjHJJDK4"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67989a98f8bso378831d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970447; cv=none;
        d=google.com; s=arc-20260327;
        b=GSrgYbe0XmAO5A1/FAmOZY5vsE6OH3aa+HF+KSNt36tfwYJhHdW4eFMZwL79b2pbCI
         7JSNkeeBwx8nMQxtKeqD6DRHOqcDqevig2q+XyOTdlm/hJrnDmr6MkbmmzSwhQ+A2DIY
         3TZ3nJIiLQ6Ms7dyVs59vX4UlQe3HS1d+dHTMsbfa4059pdeLseSxFaduOvQRa9ubv9j
         Y0DfykYWLnO1MbPiRrrNwNboqQn81XJoEezyg/S8IXVoBugJKG4vX200hsq1zUOk2wIi
         FI+T3PmS1roMjJTYW8/uHQTW+XlelYsC0svGkJbMe5U0rWVoEEF7lAiM0pH1mApnebxF
         BWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p1yUYx/ZNgf5tuSLit2Tisfqpid+gK/d62ApUZjCpxE=;
        fh=i2b1fAuEsxalwp5gJjOXndx4alGip7pwhJ98yHWmZwg=;
        b=p5JSAJkQ57lYUnpUdQtivybqeu+gQVMwHRlNbpKsa0ei40VElwVFH3lnE33yASxhIs
         6CFsqjjWglBeKKoMAooYlRMLpFllUW1Q6kRdxl3lDeNAob/dP+L+d1fLnBNd3Xn+RyE0
         w5EGs9UcoCSv7JprwOAGlRX7xBlz9UqnKoVQblierYIUXhrOYrMAwozXDSFnBqNHxxRt
         oJYLC4+qBsiJpv9neDFIDn3sZD6LIJA9RQLNwwDNuUWk5UgeEOxoLe/jSFJupCjXsUFs
         D/QiNLOhpx33Bf5iETT/bwP3x5N8iGt5bBzM4ybJmJUTPnso3VpZmd8UqYJ3nMXe+FsS
         Fh/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970447; x=1792575247; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1yUYx/ZNgf5tuSLit2Tisfqpid+gK/d62ApUZjCpxE=;
        b=VjHJJDK45MKZ5+03GjiWbH1xZXLmn/uA43iEAiffMB4MokS6JCCpc/a5HBK3m9Ya5V
         W+cbD9SthUre7wSaWaBUb3e71c/T4xYKSbjtBGuQyLr4LTzpvZnMtiS/sMQN2OToHuAp
         LUefL4Hgc748ODlAL83L/ZQC36Y15t9a4ZRSKk3jyBppKDopwUA/MEex7EWwABsYqokn
         QWXbwZ11Xgxs6LYjvUlXz4yCxC1hJktKUlo4MHqjUm/F2Rx71z2CNLqTn8hmaPR/zio5
         t2A3cepPX0lfN8Qz6oTwkuqHzesjmn3MvHWFmrCBJtB4ysFW3wQ2glAtCMpJkZPbvFAu
         CWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970447; x=1792575247;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p1yUYx/ZNgf5tuSLit2Tisfqpid+gK/d62ApUZjCpxE=;
        b=BQUhfMQXYwSfpQVMSuv4VVGsQiO11RIoQVOubDlCqMooUn9FKYbCTcSmvWyihI+eaa
         aTfI2IQUkeVmbWRZ6eIWM7nLMvmVQp9hqAb0Uum9YrCYtLjYZi1HpBdgcxmSWLXIGc+D
         dnGx6043H5k3hPWlMkNcy0M9l0rQ+MfcqFxcRIUZGhdqOswPWJZiSdqpV91RScAguNzT
         wQvCpM+ReWxgZNMW9PF7bIn8Qbu29vk3cqG1gTF/6PpmpkfzTDCm6BzF3DYyRmEa2gd1
         tZvdmg2fTjIIWsoxIvBT/eKgON8JW2Tg3e+9/+S1o9qWhuQ3RkI4mrWAj7VuMsAzGDRi
         dgiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZvjPTGx4gz+KnHSCAbGSc9QYtXTj/fsTGFAPAhtnZ9x+QhsadD/liR+n67x7UhlARcxVYvGjLIGjwnhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhIVOtXAjjj/V0mUk2q+w9UnM//h91nO7aDyfmmhJfGdVrk3Jv
	fruRXbcx6FraEK6z5Kc/WY1dYR6yRDc36nWZh4cSRG9h0uWR//WRlYDBNEcVtNh6fZ+M19LW1kT
	xUgLZZqfWbX0vj4w4FW3psZ1NMmvCd8g=
X-Gm-Gg: AYBFou0ktqH+vYTNynD+VuqFxtjbJACImzQ9j/KyoaVYbAu+3UoG8QNWtvaUhUhqJ4X
	BiKq9bwFEYbE0B5LuivwtK7rjsnjNQY0WmAJCexdn0Ydugwe162BA5zIDkAVTMU9v5z5j4QKnFA
	svxEv/nijpnfae95f37sCFVw4BywBlQZrYroHfsTvdb3ZxB7XMSkh3R9C5zVWQ6Iin/BWAkaac5
	TQYQOKhBU5urZMEMPokjurEszkrPWPsI35EQcyw7IjWJNq6XAYfe174foGE3ptYlTJL/koY3MXe
	P3n74HOygRDqyDS3b2ZhBzZE+fj+3FJa0yDYS5S9byh/qcDLygh4cGH6Ng==
X-Received: by 2002:a05:690e:1698:b0:677:c014:29c9 with SMTP id
 956f58d0204a3-67936951bffmr6532230d50.19.1791970446793; Wed, 14 Oct 2026
 02:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
 <877bjkg35f.wl-tiwai@suse.de> <CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
 <87v774ejkp.wl-tiwai@suse.de>
In-Reply-To: <87v774ejkp.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Wed, 14 Oct 2026 17:33:54 +0800
X-Gm-Features: AclHuK_eIxhsMAtoY_UEpTCFiq6s9vgosDrs_MSEfEF8fkwQ6lGWgNyJKs8bRgQ
Message-ID: <CAFRLqsX8rqZrJfLPBOhBmuwXHq_wnxiwfxDGevfQ3wMFo2thgg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: dummy: Defer hrtimer data freeing until runtime detach
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, sammiee5311@gmail.com, 
	phucduc.bui@gmail.com, kees@kernel.org, thomas.weissschuh@linutronix.de, 
	tglx@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> That's not what I didn't understand: do both A and B use the same
> device?  The release shouldn't happen until all detached, so the
> prepare and the release can't happen concurrently for the same device.
>
> If A and B are for different devices, they don't interfere with each
> other in the case of dummy driver.
>

Yes, A and B use the same PCM device. The test opens
/dev/snd/pcmC0D0c twice, and SNDRV_PCM_IOCTL_INFO reports:

  A: card=0, device=0, subdevice=0, capture
  B: card=0, device=0, subdevice=1, capture

They are separate substreams with separate runtimes. With the hrtimer
backend selected, dummy_hrtimer_create() allocates a separate dpcm for
each runtime. The test configures both with HW_PARAMS and explicitly
links them with SNDRV_PCM_IOCTL_LINK.

Sorry, I should have been clearer about what is being released. The
PCM device remains alive throughout. The object being freed is A's
runtime->private_data, from A's driver close callback.

snd_pcm_release_substream() checks A's own ref_count. When A's last
file reference is closed, it calls A's driver close before unlinking
A, even while B is still open:

  Final close of A                  PREPARE ioctl on B
  ----------------                  ------------------
  snd_pcm_drop(): group -> SETUP
  do_hw_free(A)
  dummy_pcm_close(A)
    kfree(A's dpcm)
                                    snd_pcm_action_nonatomic(B)
                                      Take link read lock
                                      Walk group: B and A
                                      snd_pcm_do_prepare(A)
                                        dummy_pcm_prepare(A)
                                          Read freed timer_ops
  pcm_release_private(A)
    snd_pcm_unlink(A)
  snd_pcm_detach_substream(A)

B reaches A through the PCM core's linked-group iteration:
snd_pcm_action_group() invokes the prepare action for each member.
A is still linked and in SETUP at that point, which the prepare state
check accepts. The two dummy runtimes do not share their private data;
the group action explicitly invokes A's callback with A's substream.

The final close holds pcm->open_mutex, but the PREPARE path does not
take that mutex. PREPARE holds snd_pcm_link_rwsem for reading and the
members' buffer mutexes; driver close does not hold those locks across
the free. The link write lock is taken at the later unlink.

That is the overlap I meant: A's own backend data can be freed while
A is still reachable by a PREPARE action issued through B.

Best regards,
Cen Zhang
