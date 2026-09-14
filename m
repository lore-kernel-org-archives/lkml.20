Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0735639CD1B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416260; cv=none; b=VYX1GU+F+Q+8B/h/NBBjr/xbjVn9j5XO0tq/tI4oPZ8uxGbykuMnT+U1cGyz5frOdDXDfsUlQ4bqCp6dADawrhoy+5IL1T525RWMTI7vYWU0zd+1dJS6sZ4TTZUmvPtKSIr5YfWgWlQeS1PZp3xT1/+7XwSH5BV2liJKwNG/1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416260; c=relaxed/simple;
	bh=gVBPMHDvUFZ7LHqXksbl0G8iSclpJgOhQy7Cg7sDOSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAJqVkzAEfWLn1Ep1jv//qi/t22XtXEdiUUDD/pmz7Z9IviMkGkkGMPcc8BdPC8alhvkyLU7oExajcWam2BRDaBO0xi+NVXUsKFMTY/0XolBD5DRlPDSVGpXXKT2Ed1ILyb/+FVi8F+XDKLnNI3hcwpCAS9lN25y7OE2mI4ZsD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B1TInPzA; arc=none smtp.client-ip=209.85.161.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B1TInPzA"
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-6b8ef7de4bdso810043eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416258; x=1790021058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pp623zgj8rh3D0bcXBH5BWiFVK6JWL+1hwJlGhtfFXM=;
        b=SKrfpFFsVj3txcMRKleo8nrod+Y+RgZra/HzyXFrj+6CsH8RLTyyD5mKpAw9ZR7evj
         Tg0VzWJtGHrjoNg2nMLO1imLEtlPkz36fkrlV4e2SmX09f/gRLp1gQq439CGjEBzkMDE
         /m5m+AbS9VXGZJ78FsdlVvJtt+JEjBmtIxuuzb3vWagYov+CEK0pf5LZbuuZe6N1oaDn
         SScipONlLRuc2RWKwVKqtMOculL4J6MHEUwmIG//pHv6Ltb5jninMqAN0qaG4nrnu6gn
         DDuy0qjx3TrsCibK7OG+4UxeP98Zgnrh6aS9XU6IW9B+wVBCaJiyRudRqQ3VGe+2deeb
         Gqxg==
X-Forwarded-Encrypted: i=1; AKwUvByZu2qZaztnbt1wYnTGT61HCK9gB+/2w5X5Rn32tbHVhcxeSuRyIdxUr1djBEdBmZ0OJhCltwXxckppw8A=@vger.kernel.org
X-Gm-Message-State: AFuF++m/QIMBk7wJxgDpxojSl9fSE6utQWBhFjHr4i+fSM63FDv5ONso
	NLKUXtc4hLlrHsyH6Ex1FrO+NAO9m0f0XIzxNCNkEnWZt0Y5T4XhifrkVFLRcIsm4XOOJW7EwJN
	WUHKcJIw5wD5s2Uu2/tSobaYMWDjrw5CtEMAyaGlQIu0a+/yYq6lvHGOWMi4Ek4ESIszZyHp+nP
	W2fTBgZx5WfcW6a+1wLIkG7aUDGOczabpZ2qqPzcbSPKMxBJfsaUdPZsteEPaOSUavk7LrV8+U7
	t/FSM/WLCZN1jgwPewze784CA==
X-Gm-Gg: AYBFou0iPsaZLIUBLWGpoQq3qfSRTl7QKImmE1qc3T/l3a9N8zj3yRc0NvwvbmT+sWD
	fRsadiOnxKBFYYnukm8ti9KWfm3fiBJ/zOL5ZFVOJQeOrMAqcQglBBrGM8M+DOnhzivVwmfUSLe
	ZXMkxbzdSFnKdCDVWYUoLbrXCpgUykA2Z75ATKBIwpzHl59dnq9wUQ92xeMpTlFLszc5Psb7GlY
	S9FhYdHLbf3kOltdWEJ07gL9q6Iex9YWFXsScBXPJwrz8WGtinL5Ikr98ghFEoKDLmvCj5QgrZf
	zQeBQ8ANFXbgBqpr7kpgDm6U9DsGRol20BDpQhM3vO76UZ5tdzb4t1ZMzte1Fb0UeG/aD/IiuUf
	Eg18k2yg0ftiZbAaIcup6px2hRA/IiXBsWMFrIHChe3gFz6E74Q0CTFUZCe6jPqK0kqtGUifKxQ
	oBlVOHF+lrGFGxVD3CblQLjB7ZgRKB3oE2DWQeqYOcPA==
X-Received: by 2002:a05:6820:4de3:b0:6b7:8396:f3c9 with SMTP id 006d021491bc7-6c541458231mr2333263eaf.43.1789416257415;
        Mon, 14 Sep 2026 13:04:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc4c62a7761sm4609587a12.2.2026.09.14.13.04.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e87478402so94555046d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416256; x=1790021056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pp623zgj8rh3D0bcXBH5BWiFVK6JWL+1hwJlGhtfFXM=;
        b=B1TInPzAeLy7emetVC1V6ps8TXtIqgEqRfSdKaRrmhqIuEsIt0IEj981oWS1bz0naB
         FBHwPXSYBFHRieZ7hFHVw9AO0VXvwgKRERTKq4QbM5hbnhxfOw6A4OEu1mNy3j9abmRQ
         y1m4qRvwWS3xLnVmEhx1/QGR3oSPV1c5UU1w8=
X-Forwarded-Encrypted: i=1; AKwUvBxiPPGCDWR7b8jwEhlj68vzNNIX2FGFtq+ZdUwzEdgYG19zhw2p2XP3McdgVeT3gGKYDibRufI6tiPkccQ=@vger.kernel.org
X-Received: by 2002:a05:6214:d8e:b0:90e:96a9:4c5d with SMTP id 6a1803df08f44-9122e4f371dmr67130166d6.15.1789416255437;
        Mon, 14 Sep 2026 13:04:15 -0700 (PDT)
X-Received: by 2002:a05:6214:d8e:b0:90e:96a9:4c5d with SMTP id 6a1803df08f44-9122e4f371dmr67122906d6.15.1789416250177;
        Mon, 14 Sep 2026 13:04:10 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47afc2sm102712366d6.20.2026.09.14.13.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:04:09 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	linux-rockchip@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH net-next] wifi: brcmfmac: Improve D3 substate entering timeout handling
Date: Mon, 14 Sep 2026 22:04:07 +0200
Message-ID: <20260914200407.1743850-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908-brcmfmac-bcm43752-suspend-fix-v1-1-32585639d763@collabora.com>
References: <20260908-brcmfmac-bcm43752-suspend-fix-v1-1-32585639d763@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 08 Sep 2026 17:26:12 +0200, Sebastian Reichel wrote:
> Some firmwares (e.g. BCM43752) do not service the D3_INFORM mailbox
> handshake when idle, so the D3 ACK never arrives. If WoWL is not armed
> the device is going to be powered off during system suspend and
> re-probed on resume anyway (brcmf_pcie_pm_leave_D3() handles that), so
> the missing ACK is harmless and must not abort the whole system suspend.
> When WoWL is active the device has to stay powered with its state
> preserved, so keep treating the timeout as fatal.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

[...]

> @@ -2653,8 +2653,13 @@ static int brcmf_pcie_pm_enter_D3(struct device *dev)
>  			   BRCMF_PCIE_MBDATA_TIMEOUT);
>  	if (!devinfo->mbdata_completed) {
>  		brcmf_err(bus, "Timeout on response for entering D3 substate\n");
> -		brcmf_bus_change_state(bus, BRCMF_BUS_UP);
> -		return -EIO;
> +
> +		if (devinfo->wowl_enabled) {
> +			brcmf_bus_change_state(bus, BRCMF_BUS_UP);
> +			return -EIO;
> +		}
> +
> +		brcmf_dbg(PCIE, "No D3 ACK, continuing to power the device off\n");
>  	}
>  
>  	devinfo->state = BRCMFMAC_PCIE_STATE_DOWN;

brcmf_err() is still emitted unconditionally on timeout, which means
affected devices will log an error message to dmesg on every suspend
even when WoWL is not armed and the missing ACK is expected/harmless.
Please move brcmf_err() inside the if (devinfo->wowl_enabled) check.

Also, please target wireless-next instead of net-next in the subject prefix
for the next version.

Regards,
Arend
