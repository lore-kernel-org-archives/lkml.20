Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489726;
	b=CVzp2gJ/CmC9F1G77AnB7n4qHigcmcc16qGNdIBFCTpyXKGy9ynWMezvn8GkpJvnsjrq
	 qxW74sYhKMGr3E7GaXTrvXk1tBj4y0Y4CSIgXh714i3ShpcexFS5356hp6YfvVn4Mg+FX
	 PR/ESnZcdg99B0ArvAMaAsD7vg7z0LkHyrF8ElKK4+uBftckVo2NDmzsDtIL7qZKATOJe
	 RKhfVZR2UBHZB4LD2MC6vp+ZxRClz4+svBsjiubpHJL0kZ+JHTXMJ2mCb/hTjGnKI/3Ec
	 KF2FrEfplnEvkyj0wWNP+v56NGTrMWy/jizNvQ5EHebI1WIWGTXewhO2npW0qZ/NkXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ptcaQ/mmnVBIFNqVPWzP07HOrBZ4MgjBk8UWEyOzk8M=;
	b=BGxDfnRStvhZR4HzHIW3koBLgar4SZ0/GxpFb3etbNYw5pKaFkmFoakNhHABNqz3V8jP
	 mU5m8r5YMmi/jGlsB00R+f3+QWVBliI4ELB2Ssrx9/M9/HWRjAZFGle6jATWC3Ugf7Lhk
	 yzxtEyFRxxI5v4cffg789Dv9rs6YKK1Zp8pBf+AkTj2izYZuemmp/f80wLMWkwgSqZiU4
	 vdl4tlR+tmJ7pVZ4NkbWVHr6MTScgiNQzB3YnnE/z9pRSFSM+n4PS+CvDBEwF8ZWbpzor
	 8V9KesXCDQaoWzGx7A017+RJYYzhgCSChadv46/Qp3F3gC+i+tSaOOZjk1/KlSqEVhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fl8rHSU4;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D3606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906D3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fl8rHSU4
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49a92144733so647293f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794489725; x=1795094525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ptcaQ/mmnVBIFNqVPWzP07HOrBZ4MgjBk8UWEyOzk8M=;
        b=Fl8rHSU4VjWIvjTqKm3mv07NYIN053QH09rrgXb21gDXeSAV19IX2FEGejdMnlakW6
         jAZBU2j66p0SGVL/kSbpF3B4hQQEdEsKr8ba9fqR2phkGt4cROZNQVjBDeYiEZd1rt7c
         wd24DJLpwQZCMOYXTemmZ5rN1UDZlbqgucngtWShhcOyT+piSlYMivamx7I+GHrSCKDp
         8MHlinV2bA61Zk8sz1P+75U8bsYh7aHkwv7BUKykTS7L6NPj/3IaMGEG2vpSfqmM6n1a
         XI7MT04UzMAQcNG5W1zXlmvl3ln5ixGwEjPkhgm0Ka7O3n2kNbHBTPvVqUUsTcg/m6h+
         JYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489725; x=1795094525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptcaQ/mmnVBIFNqVPWzP07HOrBZ4MgjBk8UWEyOzk8M=;
        b=ymADGptwSbna9f2ubCgl3yagOHRsqzGEH1Ij5w356Tc+PwqiubbO3ONx/xqVCNfFQi
         xqmZzKGCXW/1p3jB/w3lk1qX3z5B7QVEgDiD4YrehrnoW6V1rEc6JVfbfmtp5hLIfGyo
         Px8p8QNcoWGUogXE9j25W6qMQglLeKdax2h842Yzit+g+H0+zKmBgQBcc7gDoVjoAuPY
         3KMMChquTgsrM1HApRarwAh4VMtjk9L5BV560U3BycYGp61XTL1mG3WpTxBFwt6a3ef6
         w98P4x8UPJQ/7WuvqUN7ED4h4xTj+CS2e9+473muEe6/5w3O+EPV2x8Eui4AaOJiit6M
         0U9A==
X-Forwarded-Encrypted: i=1; AL+hErGBBCrVyec6XESUus52dZYdcnV+IweWmEzuocg5tGblZp2ndSe7WnVidL+1VHY9zcmYquDNXR9OuffsMNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TJ3SWpU8Hs51xGzJ1oH6Fk3JWgWBdDqHpPf5f+GrO+6KKbIKb
	tE7Zka37QgRX8vo5en97fndp60i7YKCEReHdJMrA8/dfI0Wd1El+FSOzpgceUdqvG5o=
X-Gm-Gg: AYBFou2KV/Gwa6fmcVRed9zr77V7GWxNuHHfUj+T46jiYutEsFQlWRA5U8xRIuOhInZ
	n64cc5Ua5zDL4JAFAzRztaJ6vj0E38O0efsFJWyx1smYI2JaM86ucBd95x4TxLaYyMCU2PRUkdf
	yuT+pOknR9NW1gLpPIN1zUWAB6sbPOR7OVeg1J0zSzDZtBgQ6N3HvrtESIcrUDOGZZR9bOzLZb9
	OWez0tDKG+bxz16x2/f8yB2JZj7HG2cI1lMa1KfzAg6QYKOHQjECEYbyJdeaptBmR/z8g6ICqso
	j1PFIi7JFkI0YxNMLjRerFQm+y/V1fEzQp8Xq4zzrmyLHzH30V2W/1qVuz2kEjqqLgMwm3BL4Tn
	G3hbF0b7DpxudCCfJwuCG9Qj7caChgRq+s/nSSY/WIbPsblgKh/bB+RUBbLpmWzzUo/ahf4G7Gn
	Vpn82nnH2SgbRzAWibLfvhAfPayYUnk5b/8cB4LBxs9ZfOSddSDFLQlei4tc21dFfiKfa3t0/ao
	8/FRYSxGD7TFdXlSOEUX+tPcO4BUs4zsEch2ZA0R/i/9dYZl6rS95WZM7X30eIae2tB8uwj1lj8
	5RN0V2+Bnj6qfyQc8Ec3kRN1fxPc8LU=
X-Received: by 2002:a05:600c:871b:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4ba0938a51cmr105848555e9.15.1794489724983;
        Thu, 12 Nov 2026 05:22:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09536ebfsm131726935e9.5.2026.11.12.05.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:22:04 -0800 (PST)
Date: Thu, 12 Nov 2026 14:22:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>, jpoimboe@kernel.org,
	joe.lawrence@redhat.com
Cc: mbenes@suse.cz, song@kernel.org, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/9] livepatch: Add support for scoped atomic replace
Message-ID: <avW9ehNSLH2zcXMM@pathway.suse.cz>
References: <20261026133651.40061-1-laoar.shao@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261026133651.40061-1-laoar.shao@gmail.com>

On Mon 2026-10-26 21:36:42, Yafang Shao wrote:
> Atomic replacement is currently all-or-nothing: a livepatch with
> "replace" set either atomically replaces all previously installed
> livepatches, or - with "replace" disabled - it replaces none. There
> is no way to atomically replace only a selected set of livepatches
> while keeping the rest running untouched.
> 
> We previously proposed a BPF+livepatch method to enable rapid
> experimentation with new kernel features without interrupting production
> workloads:
> 
>   https://lore.kernel.org/live-patching/20260402092607.96430-1-laoar.shao@gmail.com/
> 
> In the resulting discussion, Song and Petr suggested that it should be
> possible to selectively replace or skip individual livepatches.
> 
> This patchset introduces a more flexible model using two new fields in
> struct klp_patch:
> 
> - provides: an unsigned int id identifying the replacement scope of
>   the livepatch. Livepatches that share the same provides id replace
>   each other, so at most one livepatch of each provides id can be
>   enabled at a time. By default (provides=0), every livepatch that
>   does not declare an explicit provides id belongs to the same scope:
>   loading a new provides=0 livepatch atomically replaces the
>   previously enabled one.
> 
> - obsoletes: an optional array of unsigned int ids specifying
>   additional provides ids to be replaced. This allows a new patch
>   to explicitly obsolete patches from different scopes.
> 
> A new livepatch atomically replaces any existing livepatch that
> satisfies either of the following conditions:
> 
>   1. it has the same provides id as the new patch,
>   2. its provides id is listed in the new patch's obsoletes list.
> 
> A new livepatch that does not replace an existing one can coexist
> with it. In this case, the two livepatches must not modify the same
> function, or use the state with the same id. Any attempt to load an
> incompatible livepatch will be rejected by the kernel.
> 
> Previously, setting 'replace' to 0 was the only way to keep
> certain livepatches persistent on the system, forcing developers to
> disable atomic replacement entirely. With the introduction of provides
> and obsoletes, developers now have a selective option to keep specific
> livepatches persistent while maintaining atomic replacement capabilities
> elsewhere.
> 
> IMPORTANT:
> - this design deprecates the traditional non-atomic-replace model.
> - the behavior of replacing all non-atomic-replace livepatches with a
>   single atomic-replace livepatch is also deprecated.
> 
> The new "provides" and "obsoletes" attributes are exposed through
> sysfs and the kselftests cover the replacement and coexistence
> semantics described above.
> 
> At present, KLP state, shadow variables, and callbacks are not
> integrated with the new provides/obsoletes mechanism in this patchset.
> Support for these features is deferred until Petr's klp-state-transfer
> infrastructure is completed and merged:
> 
>   https://github.com/pmladek/linux/tree/klp-state-transfer-v1-iter12
> 
> It is based on livepatching tree's for-next branch.

I double checked the patchset and it looks ready for linux-next.

Just to be sure, Joe, Josh, anyone else, would you still like
to review this patchset, please? I am going to commit it early
next week unless anyone complains ;-)

Best Regards,
Petr
