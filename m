Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9B3367B6D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129942; cv=pass; b=Uf5KYf5J8OrSzRWiLWbxYdnt26/TnOkclpc/CIKPebp8QjpMRMvFgRbSovu8XZ1ZYM+RGpzeEGhcVimv9zFUksY0LawtDHCZ+OgDBVl4V0i5ROV0V+7c44HwtewIBkTQmYe1MsccYaQ/qNianDeY9ZVNyHlm9bJMpTSTGJub3NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129942; c=relaxed/simple;
	bh=JqhgSbKXiRs9KJieJ1Lo+MaB0d6v2jx8N12NDJx+2Yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/CdvcqzWVJNGrhMAGb7+9KyxrHT0JRyX+QGFzqWf+F77RsNZslU+a/VnlC6DjCMN7HdiesmIlC7ZLqqgzcmhLosRlbLwoJFObHb/+Z3IYlANkqg4bbu9RrDrqXS9bgUEzb4a3yHaRuz7J9U/ddeYYRiaCJNpl2z208E0VXFI9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=RjGZsGAq; arc=pass smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="RjGZsGAq"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-675617094f5so599663d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791129939; cv=none;
        d=google.com; s=arc-20260327;
        b=jxQwdEQln+lu8KuXJjfgVSXd2oezB2D8WRsScpzPW45PAI0y1X1NqPgaYli4otCBih
         py3F6bn+Q7XpQCk5mcU+YYibsNADz0LSqlSbDxqoF4J1Cioc0KjMCiddxX2WSHn9MrMS
         TT/efbmNWGyzil6jsbwKHO9Y/oaQaFKTAhOoWSpD46n/7o8faIVtLuTXi5xZSx6IlQbq
         VgtzEG6EPAmlATs4q0NEG8yICJXILHO33YskQkOsc2JqmkR4+xDXQT2q3MkqD54y6uG+
         Nd37QKH3rPdIkQ/lzx3K4jp7wRd83rOfkkNuh0lRoxiSohDJbFqKo+6B9TsMVYKILQpB
         Z1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y3fsU5omFgw6BhNB+mUuwA3rZgfGs6fxlIGxVAPmPAU=;
        fh=ugkOwHiBF+yhiu/WTc4gdNnKoypOh3r+lhdouVJcNJo=;
        b=rnB2kuxcEHk6nYk3XbIgYOgSbIrWHsyh9pIxj28cEQQMkOP5OKKLQb+TYVUjR1eQzt
         9vB4BIKnCVCu7tyZhkG6dSPmT7ZES7h2SYrQd2qExoSnk0h4G7SCTJuNoz/nCmP1eIjn
         b0+JII4qytlu5ZC7DLmKlbxzZNMJVnPgetqM2iZQWg15kA0dYEChHH5EHlNIVNgfCQOH
         VceSN9GRr8D4rNAV0pkVdIS3laZ6i6lf5MWoXVMndvr5FCxbPJmtr2ADcJZRwNRY5/hY
         udxeNKUxq9483otAykGiFYMH2lXKmqY5+ckGBeDhOT4+HtgaWY/LwqK41kUvzGzg80k4
         dUeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791129939; x=1791734739; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3fsU5omFgw6BhNB+mUuwA3rZgfGs6fxlIGxVAPmPAU=;
        b=RjGZsGAqhhSreoarXDoOvhzfpy3W/aOihmSVvX3Tf9P2vktJ2e6wWDjLIdVPrpjh1D
         oschrti25pzjEp6Mnwk5tiZKjiopvhZ6PS2DbllQr7ta2pDNWnE0EuT85UzqWdfHMlCh
         saoVnuiF4AUA6Ldbc9TYJOaaXNBmO9wTz/TTeex4BUacJeZZrS7VPRi5F0AsFenJmXPM
         Sgn6CmXMAq2bhzDUmzeXvTrTE/2Zj0wYyQAl1gGWJ77mvGSX6T9qkcvM+LfLp7q63jKO
         303rmGpSP1Aa33AGwS1cC4SdaT2DgMuRi7/M4z1QemGdjhq5++ndolRtCJ+teG8PHDOo
         BG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791129939; x=1791734739;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3fsU5omFgw6BhNB+mUuwA3rZgfGs6fxlIGxVAPmPAU=;
        b=U9FMGCVSUovi38sKe1HkgbqPNSUevY2r4zPYzQAzUaOOZJjyqe+2KdEbSwST1ahC8y
         p4T/roKAaqL2ie3kUBgoTedFDRQIQcVuChqSAmVsuz9JPB/Z+tEULLpLMQpnjDdyeCWc
         K0lhMZYbx0K5JNdqw5xD6FHuumd6QLDdqQ2VpK92M1uzCoHE/AiHXc18tmM/DWJKuJeI
         GhHJxnmKPfHMOhsPHsXw3tZdlHwy/hROGQdcxgSpumf8W6/FcYmiaLBWl8ZN/k8rsAZ9
         hyjuPbpYnnkwJrtK6qEu0h9kD0y+C/425+mW3wg7i0UPXdq55bP3lbPE7Y/BwlpfcW/9
         B3UA==
X-Forwarded-Encrypted: i=1; AKwUvBwaSNQmicx6V+V5kyhZU6UCSckC6wCLPTMymHCojdUJwsp8YtUQTFS4MGVtt5dGOnTRWwbJfZFVbqKd/mY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYFeQzjTzPgATEy/pzV15wkjy+Jn4UhCmvsluWKMO4vGdJjP8m
	/ojaqD1JkJCd04SOC3sqzdCmR9BV1RZ7Xhg0Gx0iYD0dxCs8OyhGC+yADvYlw3Af7B0CG/khSWX
	PrgCRDYZt0FwkJPDQC/g0NT8De7Raq75jLvUzvUat
X-Gm-Gg: AYBFou35IM3VTcYEr00BH+GGjHamp2UIhEn3CW+tCAsF+8y/qoeUgwdI8DwI0UzUDqt
	okJVz7i0AzOCHpWfFH/U0MCyTR9iKa7QZFeiY/kHA9y2XF2ohpAUk3pcGY0TISQdeubKWVDZ4Rk
	n3IPnxvBE2LF8bVs/U88m7U57BSaWFVlLJU6Rw9X1MHsdhQRhv7CJqLuxBxL0hLtcIi2tVoDUaz
	W2B7K5JR5uCs1+1tVg5od5+xuF81+cgiCPx0sOI0uIA9beIwubUS6vooeoyYh3Gnvhox+Bn6sp4
	IppAosaX8Pv4as4imdSX32wQViMj/56ccJ5yOOoec//06iK8ynO4+Ra9q7/6Ue9CuXq1lbwlh0l
	aa01Y10UYLuNktNB5yWCl1NvGPBHm3mG8DBjy2BV8dvuvbJi9gdA729n/HarKtekMQGVYXEObNK
	sgNsOdMQCHZBYs8h4SZ2P1C7MtbOXvVaJIT7G7QMSbNd0hG6hQLkFffS/fAoQfB6OkzwN52+hoa
	/J9pPzqIJXgXIFa5vff+lkxJlMaVrNd9dlUar5CLBB5iEPuvTPivcYvLesy6DenQoF7og==
X-Received: by 2002:a05:690e:1616:b0:672:be40:5eaf with SMTP id
 956f58d0204a3-677ac079547mr3282301d50.54.1791129938951; Sun, 04 Oct 2026
 09:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004124254.3525496-1-julius@bairaktaris.de> <01600be7-3d8b-48b2-a59a-1125eb452714@blackwall.org>
In-Reply-To: <01600be7-3d8b-48b2-a59a-1125eb452714@blackwall.org>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 4 Oct 2026 16:05:02 +0000
X-Gm-Features: AclHuK90kbEfr1-jBe_BFIZ77DR1u5zlZLof02Y-HmHYvTegFl8NjlWTcp5jAKI
Message-ID: <CAC1t37+4-Pf3j_x4_cYj-+_hj50W66f7TZWQaLavPJwSzmAf5Q@mail.gmail.com>
Subject: Re: [PATCH net] net: bridge: fdb: hold hash_lock when an entry roams
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: netdev@vger.kernel.org, bridge@lists.linux.dev, 
	Ido Schimmel <idosch@nvidia.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nik,

Thanks for the review. Sounds reasonable to me and I will look into it.

Julius

Am So., 4. Okt. 2026 um 13:44 Uhr schrieb Nikolay Aleksandrov
<razor@blackwall.org>:
>
> On 04/10/2026 15:42, Julius Bairaktaris wrote:
> > br_fdb_update() lets an entry roam to a new port without holding
> > hash_lock. It notifies switchdev that the entry left the old port,
> > writes the new port, then notifies the addition. When two CPUs receive
> > the same source address on different ports, these steps interleave: a
> > driver sees two deletions for one addition, or an addition for the port
> > the other CPU wrote.
> >
> > DSA counts references to a host address on the CPU port. The extra
> > deletion fails and the extra addition is never released:
> >
> >    qca-ppe 3a000000.ppe: port 5 failed to delete 02:5a:0b:a2:1a:46 vid 0 from fdb: -2
> >
> > With one address roaming between a DSA user port and a Wi-Fi AP port of
> > the same bridge, the error appears 3-6 times per address when the two
> > ports receive on different CPUs, and not at all when they share one CPU
> > (4 runs each). With this change it does not appear (6 runs, different
> > CPUs).
> >
> > Take hash_lock when the entry roams or its flags change, and send both
> > notifications under it. The common case, where the entry neither roams
> > nor changes, stays lockless.
> >
> > Fixes: 90dc8fd36078 ("net: bridge: notify switchdev of disappearance of old FDB entry upon migration")
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> > ---
> >
> > Notes:
> >      net-next 941056f91907 ("net: bridge: fdb: factor out existing entry updates")
> >      moves this code into __fdb_update(); the same change applies there.
> >
> >   net/bridge/br_fdb.c | 14 ++++++++++++--
> >   1 file changed, 12 insertions(+), 2 deletions(-)
> >
>
> Absolutely not, this was made intentionally. Taking the hash_lock would further kill learning
> and roaming scaling. Surely switchdev drivers must have dealt with this for some time
> now, if you'd like to fix it do it so the software path isn't affected.
>
> Cheers,
>   Nik
>
>
>
