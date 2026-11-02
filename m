Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793618715;
	b=anm394r3U/OooUDBL+x5KVOC/2mngRqwvOQZWj8WH3NwihGvukUwL5UwOf1T+zy7mjgW
	 8xQbT159OLLwhYnTa9z7ctDTZhUugo5NeTS5suzbQ4AtLn6TE7yOehYnGhwDwyAiD/mSC
	 KPL/+i44mMruEFdNrdAEkZ2o+TMpcCkx9pCe/518HLdjbDX4gyvZ4NbBJoUyj+QrY4M59
	 SPc0Tb9NkyoHflJcJnG4XVlVg0Uu4XkVhhGo8ZwCczkSA16q93ZGuNpQpU0S3h6Vd8Llp
	 zPwLN8wJ9LKD9fSRYr7gHRvZ6pnOhKNEHmilfhygGl0rBJGM6Ntn8U8fCbAKgn2a0Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kUMha13mPNBOHq6FS6lq86bkIYOWnWQxqSrJsZzXQ54=;
	b=W2aVCMt3UmustxJwRqVVTJnXehfTspQlx62LnFRIUBmuLOFp0gjXtF9m0Y6WcU4XTV6k
	 a8HWzPmn08I4fUo4B8R7rPOK/0RG9tJYyNQnjTrS3QdX0vgVOQBA4msGmzgn94dl09dgx
	 7v/AGkdcADFIG4DqYdm3m72RLG0EGvtFyKwkDxakJ7lLxyejzpGCeuDQPeQqNymrKDFrS
	 RYtp5zehvEk/gFuyG3sjJAC3/DaFnJq412wDGG/KphQoB9/vtSczMTlqtHv2MgmJ61N3g
	 7MdHNfbM11b1bgS4EDy2YrmZbsCk+qiST6sK4SsbH3UPF9QNvq98NlVC/+H5ZLLNhsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJ4OYDRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E7606A88E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809E7606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJ4OYDRK
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1108992a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793618715; cv=none;
        d=google.com; s=arc-20260327;
        b=fPfgpr8uHWLI0tjwXJnME0O4qHfkS05ZFxEgryQn+YoeRzi4m6f6DXCRLGK6QYDpmB
         m11cOEweIaFgzTqba/k1NMKLXr6T0hwF2bspyo3invLluJVpZFqvWMuU7ZSnzuGPGWdT
         ZBLOJSzG2dxX++EyZZdvH5yABXdVhfgbclFoYoYB/6FligXNT8Ss6GnZOv0tDBBITesh
         h20UASnHitwpNVa+Ry8gSYidmjaFxhcrrX/MV8A/EVq4r5C6igwFT5y7zQ9GV+aL/T2J
         Ax4BOcQ/QO/dD3iDe/EPixztnGADCebg7AN4/kTq28mvyJpu9pTst5i21ROZurmhqob5
         K4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kUMha13mPNBOHq6FS6lq86bkIYOWnWQxqSrJsZzXQ54=;
        fh=IumpteSyu5ie5KEek8x9mG3PWtr6Q11LxLk2ZKVv474=;
        b=JBeZHgqym4ox3x0vma+cUe6bASXYNd6xI55Ofg5nNl5cXg/7rfaPluPsunHq0Y8z0m
         PQOhDbkfQvgFiMagibCz2+MsoDhwHNa8pXUczdt31AAPPnWsaR7mRqGRMqFt++fNePVy
         28DkPy7iY91fGpf7XwV8LCZZb3qT5Wu/pw/C29HLv8mtJ6qbxmdXHuY8GC/A/6y+B7pq
         +hjr5xtj8I6KH7u4mcutrpuGdHQYNEPHY1XJnJCo5Rer4W5/aUFAP+WxhABut8VgiXGm
         0lkaYp30dQKvUs9cyYGHfcMxEZtE4NmOClpIZ3d3qEK1CxriBho4NGwBHYGYrstLPT2A
         TX0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618715; x=1794223515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kUMha13mPNBOHq6FS6lq86bkIYOWnWQxqSrJsZzXQ54=;
        b=AJ4OYDRKDvkCT7+JOoNpal4CPEtb9/AuwEoENrfuIdAtjKwWHbMVP8yeJBY7JQWjl5
         2l4JhCysnhrNCmd4TYsLHSylemR1XKawXTQ5d6nAr3rICAzifFl4shH4Dd2rec8WS0Et
         gcuy8Qmv5ufdj5iaiQJdzyBGtuZCJlUW4Ob+kLTUYa/ctHAtId1J7Yq/809eBkAPa4yX
         clDV34TTIsQTkkY/F12pWrE2PFXriiH4IhaCMCsCkNPCzGBzoWJ0GVCgkk1ojhjlXR4B
         CzZis0fx5rz44f14kpR4LjOQdkoG7/lX0wD4ttLMI3uDBenC2/AW6jCIVo30ITw1R7mI
         dhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618715; x=1794223515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUMha13mPNBOHq6FS6lq86bkIYOWnWQxqSrJsZzXQ54=;
        b=MAO6Yeq+X+w7lowubGFTxB++ZSihnPkf+Y3kZms9gSSUzQvO4JaXRE8soO0l29epUg
         WjxiQq7t8hlCi7fpvcDqC1fAUtjvchGrMYroQeulwuJdzvmcgkq6iN9ETw8OFyRdzwoW
         zbq3N2xUdozHgZrkyXO1ev6a4D7BRZ8s+rElF+ZX72O6HgVHp45HywWbiJcW5YngfD4n
         ckSC/w5qy16kTG1JuFxjhKLMcpZE/9PpQ0aEb/CZ8RooXIvkt/pK8BebZOXV8ZsWlR9F
         TcPPDLZ1b1Ce4CuRMcBYSWwaKCwUlQ9aRisFFrTP0Mz9l5UKUn7wshPnPCE5vluR2Lb/
         HZoQ==
X-Forwarded-Encrypted: i=1; AKwUvBygApFnfLLLwCoZjohyQ6Ue2j7EQs593F6MgZm8UcCHnXBihx4IZa5cQnoVDAHcOEzMcLgzjId9574OS0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKz42dL9kDjMyGm5AuqX2CcdtrydXyYu1poLcXJ6QHoYfY+j3Zm
	Z16T5+yzjsA0im6IixXvQN0vNaYRVQVOYneUf1LiN1JOkziBGq9tnzlzKGcU9K1bhv0uJv0IKx3
	t7/rzCW5NbTl54Bwg8qVhEvG2flPYTzs=
X-Gm-Gg: AYBFou2M6ZpjJfKPOXHuEBP4D1QsABjkkNAmISQUajprpdSOqz8nbyG7zTBYXwO3mrv
	lNo/hi3xuV3gPehqQHWztIUCvbQ4SOQ8rj3h/jPw85NwBh9+VD/eAw/9a2TfUxXL1R8Ajrfd9h9
	g+ACZOG4Mr4ctVlb9rFPS3wJ9yCwYVqhCCXpncRFWENwbbPZVdNDXZKrOBervn85d11sTJsCXlD
	uw6BJmbTEt5eN/DDDPUuf9tqSfQTTWpRcEXjg7SE2OmJnbUBCQMzJuA2gIPOOUobsEXcYB6OQAV
	881JQGTUR7GAFHFyKku6qJWMmk9M3SntyyLDiPWJRmB4qgt3G+Q1s+iMEuA6y9PtmxbfFCOnx0J
	f8EB/pkYNUuUlSr1wuVJ9frJ0RVq5IJIhiJaT2Qy/HUlf5JuBtcB355ylp8g=
X-Received: by 2002:a05:6a21:328c:b0:3e2:a1aa:aaa1 with SMTP id
 adf61e73a8af0-3e928e4772amr10672702637.67.1793618714804; Mon, 02 Nov 2026
 03:25:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028041859.1061836-1-frankljpliu@gmail.com> <a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
In-Reply-To: <a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
From: frank jpliu <frankljpliu@gmail.com>
Date: Mon, 2 Nov 2026 19:25:03 +0800
X-Gm-Features: AclHuK_BaiAC4s-_lcmqtjA1zMXAmPr5EknWzatz6dJBuiCpCR1hPyP_i5SNHkk
Message-ID: <CALqwsrDodCeJACdTTkP+fWm_DY4NxVA+DtOVeBSjNBbW2j3dnw@mail.gmail.com>
Subject: Re: [PATCH] usb: core: raise root-hub autosuspend delay to stop a busy-loop
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org, shashank.mahadasyam@sony.com, 
	johan@kernel.org, hadess@hadess.net, frankjpliu@tencent.com, 
	guanyulin@google.com, gary@garyguo.net, rafael.j.wysocki@intel.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:23=E2=80=AFAM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Wed, Oct 28, 2026 at 12:18:59PM +0800, Jianping Liu wrote:
> > From: Jianping Liu <frankjpliu@tencent.com>
> >
> > hub_probe() sets the hub autosuspend delay to 0. An idle hub is
> > therefore suspended at once, with no waiting time.
> >
> > Suspending the root hub can fail. While a port reports over-current
> > or a connect change, xHCI refuses the bus suspend and returns -EBUSY.
> > usb_runtime_suspend() returns that error. The hub is resumed, and when
> > its status URB completes the same suspend runs again.
>
> Why should root hubs be special?  An ordinary hub doesn't refuse to
> suspend because of an over-current or connect change.  xhci-hcd ought to
> behave the same way.
>
> > The PM core would normally leave a gap before that next attempt. It
> > starts the autosuspend timer only when the delay is still in the
> > future. A delay of 0 is already due, so no timer is started and there
> > is nothing to wait for. Suspend and resume repeat immediately, and one
> > CPU core stays at 100% until the port is no longer stuck.
> >
> > If a root-hub runtime suspend fails while the delay is still 0, set
> > the delay to 1000 ms so the next attempt waits. If a later runtime
> > suspend succeeds and the delay is not 0, put it back to 0.
>
> The concerns raised by Sashiko are valid.  If people really want hubs
> (or just root hubs) to have a positive autosuspend delay, it should be
> set to a small value such as 100 ms.  Not constantly alternating between
> 0 and 1000.
>
> Furthermore, this can be controlled from userspace by writing to the
> aprpopriate sysfs attribute file.  The kernel doesn't need to be
> involved.

Makes sense, thanks for the explanation. I'll drop this patch and
won't pursue it further.
Thanks for your time and the review.

Best regards,
Frank
