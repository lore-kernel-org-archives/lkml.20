Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792496986;
	b=afpI9mwQ3uKOZGT34sgfUMYcQ3DUULrK4JPtE3NvmFE6xb+fy7eSuyTGYf3ms2IqTxMp
	 Hzt9cmEGD/Ug+p7sQq9aiqqrXd0x+OYBvOSCq/F0tMElxADQJgEqSuD54qKsEkSTa3yws
	 W7cSSnlsbnRH8z+o6S4COepasUvG/k7MJchTUOgVVauDzH5H1Xha9eISYOnDKve5S5+UE
	 tkJAMoDJGucFnd9YJ5Bw3RR1X9WmXlxTPdJw/ZcM0mqrnUwcpKo3OGokfHnav2zCo9Qv9
	 q/GlFq9cLc7pVroGdqSjCaiKkwUuQ+wuOyh2yTd+ut9pKZU3+M0RClQXRucZNnRl/QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
	b=u/PXUWyAU8CZlt6H1kN9MPtl8AuXFW5PZSv3kVkW28zR1tpNxcJ5vGx080emrRFzWC25
	 bOwh4NNWmy+zDQKRl9Zd8blkbSiRIJTXtAhi+SLqoegTUK54LvQH8A0KIRSgWHfZxJYKW
	 HCy4EHKRIxxmQ+TRfH3/TtPDXU8S8VtNLYGlsPEbH8MwDr26sd3gyKVDgsjM99EUK3YEs
	 /gMueZgaPXlQe2wnnic3aLrqBT2nTQEAcJuf7shJoSrNhREYxI324IN81aE5pHpkC4M8l
	 MRIHU4rBFzSG4LfqZhyemKClEYcrY4FbxvZs5v1dTWMkD3y+RTl0qLOIDVFMP6yY9Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kiddier.org;
	spf=pass smtp.mailfrom=kiddier.org;
	dkim=pass header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b=jcEXUuFN;
	arc=fail smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060C2606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 060C2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kiddier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kiddier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b=jcEXUuFN
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5e941201909so945338e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792496985; cv=none;
        d=google.com; s=arc-20260327;
        b=fVGUTgPdWZVPj6R5qzulExi4zg/0jyAYCm/Hne90WmKp5xgDn1K1CuJU1HDyH093zI
         vZTSPNZ6+8jNvjumDUvazqnEm7ogLIulIfTsEC00Zm4pB5sgILzM2YFkEgX/y5/QOvux
         7W4PVzrdL2x9qPCR6kNZwPYBjsuV1do7J5sVQSGpU9LH+D7OtJ1ck/GVBWhqkoHwPP5M
         c5GoAekrh0Y0WGahWYIwnvALKeNLdK8yYis9fHphyJzg8i3lNRfcK3an1eViIkLr1Lj6
         FzPoRjCntdfXtyX7BkufsgY/Jjdinkr11PIdt9qFvcjYsI6SufZMKyDnvhYNg0KIZkIn
         RCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
        fh=JL+77x43m6LoSmP/A2qGPQcehWOmFUXVIitFVjoGvLk=;
        b=eDKp9FDk2Qki7WWpVMAikJd76g2emawHk7QCg+RjsySz+ZSwa+ipTBtEMxHII3vfvz
         rHNuJtD5+0ANV22nswsxKF74FTRf4Z0jrCldKx51YLte9fFv9cBl4ec8X2wJYJh/f/0C
         gM2RSpynLiXbTB9Se3lD1+hCo+/fqSn7IpuLQleWTmXIj87WUhOSc/jtm6E3mqNOVp6v
         sYVPdYFvp2phcAe1CoBC6vWNOZGf2HhiazvAoUaOWFd43yK/+N5lQS99odS7CQjabF6T
         uFvCFBV89y645wNN85Zah19w72u1p7fGXhHQZuyf1EbXpfrrNHhNh/uayDzQoi9Trsa8
         UPUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kiddier.org; s=google; t=1792496985; x=1793101785; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
        b=jcEXUuFNMltH+U9bsfQhaoEJcw3oYpquLvoEe01+X9wWxXWVoLM1NWoQ5VmxHTpO72
         CUDxuZC/MlUj6w0dEYWAgd+KNbwbAbUZTaCw/G1YeFJSNCUf8LHNp4Gw8tfsNQHImRfw
         NcVz6VVZKV1sZw3L5/1LyAKyJEVQP4JJdRmxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496985; x=1793101785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
        b=rYpxwkdRYVlD+l0RyTkKp4y3NudRzo72rpw713pGrsnjqZxu9k9eK4SJ3Ba1xHr3mF
         prHBwzq7/Gbo/p9Cog0hQdyGWXEvU5K9YrFzelCnTv2Ix4XT/GI08tUtI2TVdN4c94Zh
         kxFdZNu+MFBzdEoD4veeEa6Amm1Ap0GJ93g2ZrmLtlI42UZffuVt7UqCf7MERpPzHv39
         AOZm45ev4c+dzN+nyVBS/2nuZ/anDSYlpGlPcC6wUvhZ/d6I0Vq65yc5lolERuP/aU2A
         41Um29FbsHndxiUmNDSUqGuej1hecEHlmpuSBLv0c0vuTWL8+6oOhc0t3J9lW1OIjgCV
         pgcA==
X-Forwarded-Encrypted: i=1; AKwUvBxhTYZaqZXT8axBY40+ILWg2k4Sr0LjC4lQc5WqvsNOzqwNmfpzke9WCOFNxKkZUW8WFxOhUXIRqtquvmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0pujiUuDdJEx1So0moTUF5DMrEZwZDtgOqaVYuqBjlmsFevXq
	qLkEmcjSk+9KetAPCoX5POSNXesFbAa55FrbDf/W1rcqZnNSE6v/QF8g+dUhr61/ObN/5j3tXPz
	vcbhiYibvtsyiBQ0lYKic6TkqczjiYmBYZT9q+cjTaQ==
X-Gm-Gg: AYBFou2SRL1z6rNJmNQ67hs2KhsYbx7UBSQw3y32iR8ytBcTgH1+4OnmKc4HeDFa4Nu
	wRWnJSGBmjkmN7r6QyuJ7Llh8FibFcIBddBSJycrHN6P0UDeUB4ATdpTApcq1heDPoJPvgtx80m
	nQskEjdkm+pBJOv3Pf9y0F1DM8J+GNQnp7mNIGMZ1oSQLmj4wKTLlvmfepZfYiQ77z2c99Le/GC
	3ebZ8dQNt4grHspbaIP5ADvEg9VKkoHApE/KQWQiLiVQewJqoblq85dqLMYgrVOtq1rPsmMreic
	bSB21NgtbV0bZNj8osoSm8XTSompz45ijzv8NV2vBMmC/1h+g3YYIplNqw==
X-Received: by 2002:a05:6122:8c1:b0:5da:9b81:1aa4 with SMTP id
 71dfb90a1353d-5eaaa3c174cmr3451932e0c.5.1792496984909; Tue, 20 Oct 2026
 04:49:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CA+3E589O46nj=c1Y+Rwk_nPZZKEUjFvMfWaAFmQ2-7De9iUxFw@mail.gmail.com>
In-Reply-To: <CA+3E589O46nj=c1Y+Rwk_nPZZKEUjFvMfWaAFmQ2-7De9iUxFw@mail.gmail.com>
From: Peter Kiddier <peter@kiddier.org>
Date: Tue, 20 Oct 2026 22:49:33 +1100
X-Gm-Features: AclHuK_KgzridKLRANvtLJkSHaLWJWHnmxsRRdoNj6COaR_e09DKIcJwjLUSHC0
Message-ID: <CA+3E58-2N-uVNsmwvOGDKZvtnDQ1DF=GzFbTyRLuN8FpAd4qdg@mail.gmail.com>
Subject: [REGRESSION] BCM4355 Wi-Fi fails with Intel IOMMU on 7.3.0-2-t2-noble
To: linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, iommu@lists.linux.dev, 
	arend.vanspriel@broadcom.com, regressions@lists.linux.dev, jgg@nvidia.com, 
	kevin.tian@intel.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Adding the IOMMU maintainers and linux-kernel.

The original report and test results are below for context.

I haven't tested a vanilla upstream kernel, and may have limited time
for further testing, but wanted to share the findings in case they're
useful.

Thank you.


On Tue, 20 Oct 2026 at 22:32, Peter Kiddier <peter@kiddier.org> wrote:
>
> Hello,
>
> I am reporting a Wi-Fi regression on a 2018 Apple MacBook Air with a
> T2 chip, running Linux Mint Zena based on Ubuntu 24.04.
>
> The Broadcom BCM4355 Wi-Fi device works with kernel 7.2.11-3-t2-noble
> but fails with 7.3.0-2-t2-noble. Disabling the Intel IOMMU using
> intel_iommu=off restores Wi-Fi on 7.3.0-2.
>
> Hardware:
> - Apple MacBook Air 2018 (MacBookAir8,1)
> - Wi-Fi: Broadcom BCM4355 802.11ac Wireless LAN SoC
> - PCI ID: 14e4:43dc (subsystem 106b:0843)
> - Driver: brcmfmac
> - Interface: wlp2s0
>
> Test results:
>
> - 7.2.11-3-t2-noble, default kernel command line: Wi-Fi works.
> - 7.3.0-2-t2-noble, default kernel command line: Wi-Fi fails.
> - 7.3.0-2-t2-noble with intel_iommu=off: Wi-Fi works.
> - Reloading brcmfmac on the failing configuration does not restore Wi-Fi.
>
> On the failing 7.3.0-2 boot, the driver detects the device, loads its
> firmware and creates wlp2s0:
>
> brcmfmac 0000:02:00.0: enabling device (0000 -> 0002)
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4355c1-pcie for
> chip BCM4355/12
> brcmfmac: brcmf_c_process_txcap_blob: TxCap blob found, loading
> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4355/12 wl0: Jul  8 2023
> 17:49:51 version 9.30.503.0.32.5.87 FWID 01-e74b9cb0
> brcmfmac 0000:02:00.0 wlp2s0: renamed from wlan0
>
> However, Wi-Fi subsequently stops responding. The kernel log reports
> errors including:
>
> brcmf_msgbuf_query_dcmd: Timeout on response for query command
> brcmf_cfg80211_scan: scan error (-5)
> brcmf_run_escan: error (-5)
> brcmf_msgbuf_tx_ioctl: Failed to reserve space in commonring
> brcmf_cfg80211_get_channel: chanspec failed (-5)
>
> There is also an error creating the P2P interface:
>
> brcmf_cfg80211_add_iface: add iface p2p-dev-wlp2s0 type 10 failed: err=-52
>
> I tried reloading the driver using:
>
> sudo modprobe -r brcmfmac_wcc
> sudo modprobe -r brcmfmac
> sudo modprobe brcmfmac
>
> The driver and firmware loaded again, but Wi-Fi remained unusable.
>
> The firmware files are present under /lib/firmware/brcm/, and the
> firmware version reported by the driver is the same on the working and
> failing kernels.
>
> The brcmfmac module metadata differs between the kernels:
>
> Working kernel 7.2.11-3-t2-noble:
> srcversion: 3B6176FDB720DDE8E7C596B
>
> Failing kernel 7.3.0-2-t2-noble:
> srcversion: 3DCA38D52402541701276CF
>
> I did not find obvious PCIe AER or fatal errors in the failing boot's
> kernel log.
>
> It has been suggested testing intel_iommu=off after reloading
> brcmfmac. The driver reload did not help, but booting with
> intel_iommu=off restored Wi-Fi.
>
> This strongly suggests an interaction between Intel IOMMU handling and
> the BCM4355/brcmfmac driver in the 7.3.0-2-t2-noble kernel.
>
> I have not tested a vanilla upstream kernel, so I cannot yet confirm
> whether this reproduces outside the T2 kernel packages. Unfortunately,
> I have limited time available for further testing, so I may not be
> able to investigate additional requests promptly. I wanted to report
> the reproducible behaviour and the intel_iommu=off workaround in case
> it helps identify the regression.
>
> Could you advise on further diagnostics, or whether this should be
> investigated as an IOMMU or brcmfmac regression?
>
> Thank you.
