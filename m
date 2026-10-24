Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883634;
	b=3BhmrV5o3v0Au6lVpa0btLaO+aRvA+L1pOdrzsktRHUn/7bCIdT0mdEWwQO2tB0LNxt2
	 fb01hv2HW1CYgDH5Ffbh2uUpEZmUjAfOncT1zV9c1jfrMLrCR+IG1USFj3m9DLD0s5y0b
	 9En+W8UaL7RCJDkC+0S7AqmrJXgzEPMhQOrVTU10Zqz7oBTpgJLgyNqc4CDL5HhNbwqgx
	 5huiJKMkBqK8zAEzQO+3yyiL1jmm3GfDef3dryLajbvqxfRWg5678atS9uf3er0oznqWk
	 XcouSA/oLZIuhnlYK2sRbyxYnYpGYKieVRJJLWApW7Q2x4him9ML/AgpV3H1/gXOobQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=imAl4+nQz/6gt4gpxMhLcrwfP6Z7GTEGSm74OZaRico=;
	b=VvYauWjXFGdE0CRK2+y7tuaPzHW5/Op1nZXb9nR4KK/P+ic6vd0CakR9xos5k6nwsTKf
	 M/n6iZnWFeZVVMC+8umKNfz/RnkNsah5hnj695QgGdyPTxph+DzbCgEfQ5vi3ElSm6+I/
	 y7ntAydEoQWB7bCl7VBavCtQl7SU7QJSGUzS7rkReS9fUMIPWtEpU1COuoJFSZOLMD79I
	 F4Mp/9i25n8Jkg0qrQFmCzC2CszHdZ+XTCPfTUuMPiPFjdi0piCJQL6bdZOOIE65YkBQc
	 L48Gd3YWydw1/QGnuPUiW1ZyGz2sMdzX2zevm7EF6NmEHWvCVSMWzeqSflWLEdZ5OUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NrStFlRl;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id BEBF2606A329
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBF2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NrStFlRl
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3457967eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883633; x=1793488433; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=imAl4+nQz/6gt4gpxMhLcrwfP6Z7GTEGSm74OZaRico=;
        b=NrStFlRltiFi7cA7liJFpE6qPKybS4VZpOjC5fp0LXf/iEtTddkuQspnqk3FuCL2Gl
         P8nT2Nhhfx1/QFKJ6SAiJlDtZYbjs8u/CP9secYM9yFnL4kBM0oGONLZ9hYteeSBdwbb
         f3G0Je9HzdAkRDG//UKBtwTAdcYm9aCV2s7lxjj2pvM/XMG6w+iL60Aj+Coba8Kyrjrf
         M0jXUlBHfMi2WxcHgsnkEXOShdfRCuJSOO2Z9QcuaqYSR3Z85Y5U9quONEDqssJVybiN
         nDX67zcJAbBmTxfJJIrDE6Kqdf77Mma98YmhJlSeC1e/v4gfGW3n9sPtTyXkwOKeAH5y
         TDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883633; x=1793488433;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=imAl4+nQz/6gt4gpxMhLcrwfP6Z7GTEGSm74OZaRico=;
        b=dMvk7vDY7I3Y7zbtCfw0iYrEV95axwwetSQwn0+pVqKOLB8Avl6IsQXz7szQGV5wT0
         pZtwGXmy8apzh8vRBf2OeuDADqPTlryBUTkrHxTd+Fqg41323wuxqcuFmFULN0ZPN2Gu
         eAH/JkYg31YiF4TNJTdEVv6ECKAdRr8DbVieylsNEUDKgnSsvYRoZrD0JKUmpmbGIaHq
         fO9oMSkNsTrfZpXL0Cry6PcekOYmmKK02J+6kRQARMnR/ByiRbZDISJDPVhzcs8Ja+3z
         1P8PQR/bL3C2nU2EejGFhAZyx5v1LOstkRID+z+ljx5/u4gZfASIFPHTrxZ2Hnh0XxVh
         WoQA==
X-Forwarded-Encrypted: i=1; AKwUvBzfEvu2gDYZ+aE5ItimJ2k8vVmuzMKCFPjVdx6+5xZ2/D2y6J8ar6Q0aHPPE4XOA8NlCsgMQjXAPJ75cvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfac96G+1/nEuQhqk6t2xzhXrYGrYxtCndE44MTzsyUfM5HHJ5
	AJGOAp2pqzFXUeqKCOy5UaQRSlLf/v8QUvVE11zltA0DS1DVxCqwG/6O
X-Gm-Gg: AYBFou2QfrtNhfKJGPgzQ1g4cbyhAi+vuSXNEcFjEzlEV1hwPySi7sRRXa9MpuiEvq3
	W2DpGue47ORCY3K4PTa+sWL7JR+SjBE5srlKfSkhRz1ApueIpv+ETxpDKy7hPzBgseF/+xNPdXJ
	I/c+9Tt6JOI8LW+7zR/WdT7F+UsSKNkadWqD1cFppoXqC8lhnIWZxwrmgfPenK9RrUgwo23jcb+
	5cShCWAibFh+ZIdYVwFwOlUTfjz6WQPieNZnqY/6DZ9NGVZYt+LddoDwwmvPwhLmxxo2QUAQunn
	7ypT+W+NcQsdGEg4tREj6F3ru3NI89NoOk15SU/xpkB4dUmqxhLvQBw0p167HPFkWUW7VKukRDZ
	4JamRvVbKPp2rPpcYsB0Lu/4h4G2Ls9YC9ZalRS9NtUtobyS+NKLOLL8XZPcjEUJoM46dgQ3zdE
	O/L7iQMV4zLKywyL5GKgBvKaYOx9KK2p7e1MaC4EmgVsjJ+jrER5P682tXXcWORyU584XyTy2nz
	3+x1AV2McRocQAa088R4E/c09GYQMKhr7undi1weiL3DG7Dsy+yquhYMNaNioVKXEUKefRbIoM6
	vhRQgXO2MXDxUFDfc2CwULf2oaW1lj9QAdNlYmEX
X-Received: by 2002:a05:7022:49c:b0:144:c128:4c4b with SMTP id a92af1059eb24-19937309cd8mr5409029c88.36.1792883632404;
        Sat, 24 Oct 2026 16:13:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm10508969c88.20.2026.10.24.16.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:13:51 -0700 (PDT)
Date: Sat, 24 Oct 2026 16:13:50 -0700
Message-ID: <ab1d30eca12d5e7a764da99b68d0e229@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard controller
In-Reply-To: <5bdb870be988333df200ac7d4904dd1bda6ef52f.camel@rong.moe>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com> <8cdbdcb893e2353e0ea2fe919e0c8a6a53f8b683.camel@rong.moe> <7b21717e80a7b779ab94d964ca40ee68@gmail.com> <5bdb870be988333df200ac7d4904dd1bda6ef52f.camel@rong.moe>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Rong,

On Sat, Oct 24, 2026 at 11:30:06PM +0800, Rong Zhang wrote:
> However, the methodology has been changed from hardware-based to
> software-based. Because of the fundamental change, it has the potential
> to break something if some users depends on the side-effect of toggling
> the aux port.
>
> While my device never needs the quirk, I can think of several useful
> side-effects:
>
> - pause the interrupt (and hence pause event handling) to save some
> energy
> - prevent the touchpad from waking up the platform
> - reset faulty touchpads
>
> By switching to the software-based methodology, all these capabilities
> have gone. Of course, relying on these side-effects is a misuse, but
> relying on the parameter itself without reporting it to the mailing list
> is also a misuse! More below.

This reminds me of https://xkcd.com/1172/ ("Workflow").

Also note that I8042_CMD_AUX_DISABLE / I8042_CMD_AUX_ENABLE only toggles
the AUX clock inhibit bit in the 8042 controller; it does not power down
or reset the touchpad (psmouse is unaware that ideapad-laptop poked the
controller behind its back, which is the whole problem), and i8042
already manages the AUX port and wakeup state across suspend and resume.

> A completely new behavior reusing an old knob is always prone to break
> *something* in a obscure way unless users are notified about the change.
> Breaking something with a visible warning [1] in kmsg is much better than
> potentially breaking something in radio silence. 
>
> We don't want to support poking i8042 anymore, so the use of
> 'ctrl_ps2_aux_port' is anyway becoming unsupported. The parameter was
> introduced only for debugging and is expected to be removed at any time.
> If users don't report their use of the parameter to the mailing list,
> they are already relying on a broken setup.
>
> By renaming it and breaking the unsupported setup loudly, we encourage
> users to report quirky devices, as well as getting rid of an outdated
> parameter name.
>
> [1]: ideapad_laptop: unknown parameter 'ctrl_ps2_aux_port' ignored

We already have DMI matching for this quirk (ctrl_ps2_aux_port_list[],
which has only ever contained the 2011 IdeaPad Z570 since commit
c69e7d843d2c added it in 2022), and the module parameter simply sets the
exact same priv->features.ctrl_ps2_aux_port flag as the DMI table.

Intentionally breaking the module parameter for anyone who might be
using it for its intended purpose (making the touchpad toggle hotkey
work on an older IdeaPad) just because of hypothetical spacebar-heating
workflows does not make sense to me.

Thanks.

-- 
Dmitry
