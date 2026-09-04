Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43241D108
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505539; cv=none; b=BZ1jliyiCiUntW65SywlSb0OPC5ms5xKo2AtRwgKyuORT/1aztWoHK8olyL1lh9PfbSteI51gjI6h7sB4nBRpmpDU+NDNtHOOgMvFrWTaSpEjEMk0wwMcVmUiDleuZnO6dK5jbgzFx8ah4AoPqE+V3QHSzbhAMnYyYD4F0ziBTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505539; c=relaxed/simple;
	bh=FO7Ei7qQa/upriKmLpsNBP2XveFeD36mtVUieyMK2Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ri+3g1ejZ7ub/J57vDZYfwXBD7E79cB1VPSDZQgq8jAJs8w0fWt3C96w/JCLSggoFH5OW/6qEmxLi7Y4BieEWpPfezAuFtfTsPBzYUHtavZuOs0x+NbJuNN2J7/UIkqF3hkn9ygF8QiQowFtXt5RKoib8RU96FnzAaa8Foj3oQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/rY+LU+; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/rY+LU+"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso689282e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788505535; x=1789110335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCK1kuLgzLkj4k85zYq4Xi9yEBNBYbg/y2hUJYnpxsA=;
        b=p/rY+LU+K25oq0L5VbQvWeBnrzJqcdDD86o0HWOfdvVjX+SVgsNlyJsvQQtMrpceRW
         qXp6gHjtV1gwwgcoYxjAsidKoQbcSxYZmw/wpcfj40CG4O3dAqCtnX6314VHjUzalsyk
         tqeOwKoqicyIK7qN0u67oBPUqBEplLrHex0IxSwCEgof5hwmimyE9pib2tezDAACnpl6
         0Jv76VE1OKkPdgGTvSIjXIoD9rYss38IoDI4vnvGQSM15B6IqnZEq/JBefJww1NLNjrG
         Bz8uGYm6+5YFA3dEOrjWw/SQNXQxT0tfC2hF9XewH96yGySMieNbfXVxcfTmoQQ+vLWL
         CvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505535; x=1789110335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCK1kuLgzLkj4k85zYq4Xi9yEBNBYbg/y2hUJYnpxsA=;
        b=X7NOtf92bLTGEOSrMkJo8NP8syIcUlz/EHdz6cW0pgKRRW94c+rsxYxWx5huHw2Cpy
         LqZmt5+QZ/eWciAo2zui7sSc38vODqkb9GisRsgHwEQJ6bplnum7k4z4I7YV7V8eXaRV
         q2oJbM5B/flabMJ0KHq60SuioSOkTCYA2HJqW91xT5vu4TJewqzNNwU+ikb7N6VPdF/U
         jPUUl65e2GOE8bGkAhXWuDKganW2X9vt5kD4x4ZjoXd43Sl5jSZBEM1KSQP4QcnImphn
         7uLdHrbC65F8NqU2ovnKAS1AUkfSdxAv0BwmVnbXhYWMNcJ9sXM3owT0i+cWdHoUfjLx
         aF1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVDQONxA1N0qZWXadjY660er4qkKSR1/asq6SONJ6lAJyrAl7z5aPCgLJKf5Ie+UZeZyTqCdnKv7MrdbA=@vger.kernel.org
X-Gm-Message-State: AFuF++mA3f7vgHKBShl21XozKSvSYlIFWL0NTz7sbplLgj5edAf4laeC
	Aglm3uWhqsAS1zb1gVyjqj/FAz49Gb7n0WP/RMsnmo85x8NQQPOqP1xU
X-Gm-Gg: AYBFou312j6sAaXUQLplMGhT6AVmqS0RJRgXVZz26NMI9DsAnPuZFgmOd5b7sOc8mcr
	VmYrRIskXGqegYGfJOwaOe2fywTXi+1YuKSTDefHwmRUaokl7VlOTU24ixmWvX5K45KhNUi7owB
	oHUsAB8wECE7L34AhS/SqfPnTZAqaLg1vU+kJW1aHEaft5v+LUWPLgRc1mBk3upca7DVbiWeKVp
	JXeiYoUK+8z/TYIhVQ9yMfMNyPYUci8siamM9CxYjmSObG8Hdh6N/2EbQSU3mk7ivJBaU/bIuHY
	pl+Exogk1nAoG2CwOdGZscqAy1e2aOu9aa0c7/9DR0zEEP05+P72Cmnm4P80u/9OfusoAoZh8pF
	fLYmTkcNJj7hsBYNT7Ogb19CIECkbo/jit1KDhDUoUjTNoSDzLxxPsBw5bcx9GEg07SrfCYaAsi
	lJLQKLNziQpmmuKA1w41KXo7iWp79xj/aNhRHjmokekF9G3NzJS7zIZNWLKJOZ+7Nxgbf6A4KDE
	Xf0gsCDqLG3gIL9HMbFtQ93W++1yoVFWOKiDUPF2F9fbJVkl25selY+i8Tw
X-Received: by 2002:ac2:51cb:0:b0:5b6:183c:5c8a with SMTP id 2adb3069b0e04-5b6183c5d4emr335765e87.40.1788505534925;
        Fri, 04 Sep 2026 00:05:34 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ecebesm355911e87.27.2026.09.04.00.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:05:33 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] ALSA: usb-audio: the Topping M62's vendor controls
Date: Fri,  4 Sep 2026 12:05:30 +0500
Message-ID: <20260904070530.195389-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904001818.66423-1-mikhail.v.gavrilov@gmail.com>
References: <20260904001818.66423-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 04 Sep 2026 05:18:18 +0500, I wrote:
>
> **The card cannot be read. Not by this driver, and not by the vendor's
> own application.**

That is wrong, and I would rather correct it before it is answered.
The card does report its state. It reports rather a lot of it. What I
had was two blind spots that happened to hide the same thing.

**What I missed.** In four of the six captures the state restorers on
this machine wrote to the card about 90 ms after the bind, so the
report that arrives at 5.2 s described their write and was
indistinguishable from silence. In the one capture with the restorers
disabled, nothing was plugged into any input -- and the card reports
the gain only of an input whose jack is present, so there was nothing
for it to report. Each blind spot alone would have been enough.

Repeating that capture with a coupler in IN 1 and every restorer
masked: the card sent 0x21/0x04 = 50 at 5.17 s, which is exactly what
I had set by hand on the front panel. Twenty-two outgoing frames in
the whole run, all of them 0x11/0x24 or 0x11/0x26. Nothing was
written; that value came from the card.

Then I turned the knobs by hand, still with nothing writing:

  - Mic-1, 50 up to 53 and back to 50: every step reported, seventeen
    frames of 0x21/0x04;
  - the headphone volume, likewise: five frames of 0x64/0x03, 32, 33,
    33, 32, 31.

So the corrected picture:

                        announced at connect       when a hand moves it
  five input gains      yes, if the jack is        yes
                        present, ~5.2 s after
                        subscribe
  two output volumes    no                         yes
  two selectors         no                         never

The model that fits: **the card reports what a hand does to the
hardware, not what its settings are.** Jack states, mutes, battery and
the gain of a connected input are all physical facts it knows by
itself. An output volume is a setting, so it is not in the connect
report -- but its knob is on the front panel, so turning it is an
event and that is reported. A source selector has no front-panel
control at all, which is why nothing about it ever arrives: there is
no event to report, not a missing command.

That last point is worth stating plainly because it retires a question
I have been asking since v2. The "Unknown" first item on the two
selectors is not a compromise; it is the accurate description of a
control the host can set and can never learn. If another host set it,
this one cannot find out, and no firmware change short of adding a
query would alter that.

**I withdraw the proposal at the end of my last mail.** Writing the
minimum to the gains at bind, after init_cur_mix_raw(), would destroy
a value the card is about to report 5.2 s later. It was the right
shape for a device that cannot be read and the wrong shape for this
one.

What the measurement suggests instead is that the driver's problem is
a race it need not enter. alsactl restores at 90 ms; the truth arrives
at 5.2 s; the driver loses by a factor of fifty and publishes an
invented number in between. But the component road you suggested can
simply not publish yet: hold component_add() until the first report
lands, and the controls appear late, once, with the values the panel
actually has. Nothing restores over them because they do not exist to
be restored. A mixer quirk cannot express that; the component split
can, which is an argument for it I did not have this morning.

The output volumes stay unknown until someone touches them, and the
selectors stay Unknown until someone writes them. That is honest
incompleteness rather than invention, and it is as good as this
hardware allows.

What stands from the last mail: the vendor application still issues
162 frames on connect and not one read; 0x11/0x26 still goes out after
its bulk push rather than before; a value set by hand still does not
survive being plugged into another host, since MCC overwrote my 70
with its stored 50 forty milliseconds after connecting. What does not
stand is the conclusion I drew from those, and the recommendation.

Sorry for the noise. I would rather send this than have you answer the
version I got wrong.

-- 
Mikhail
