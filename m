Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776587;
	b=SRZ9scSv/J61YQzqWTgJVeubsV6nvw0rliQGmlkco8TVWF4dvPeWt8a64nG8KfJc/DXk
	 GMcYkgJDXPQNE4a7gspcrbhwS0LwDqBNqfykPgCTkfLDSQN1sGw1zaFFpf7GW8bJHukQ1
	 5hPyKnrF9RMnnJM/ANVqxxTP4SzEiH286YLwF7aeWdlEPogJU2H5zRBYaOiOzpQrNk50f
	 sn3oQ1ZVWtHVdiKIkFtAlkswFPO4W2PBvBgKznqbNrj662YVVclgh9sZglLEgAbAKikMN
	 /L6odsgEP6UB/pCctPSHcgcuLLsyTKru26se1zk8YBD2gRmAsFUsifzIhJ+onHZY22g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776587;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=UWIlSlhDqIZVJylV02U3W5JWNr4VF81Iz41rAjFMs+U=;
	b=rGyMq/SpkNI7bbqHmBtQzxdSeT5VatSqfU1krBSP9773YsYKdwG5RFUPb83A0ELgGAxk
	 LC75r4zgnOVQQWo2eocQ6qW1tLYbzkd23Y3Oa3/PefdWp87y/tb2Gu04lcslVwtG6yhO8
	 xyGY49ItM71oshAkEHjrIhXNY84BFMGeADsSD8GL2ecaHeWFs83VL6XYqdfJzdHx83ot1
	 tVZwviBqEwlmVZ+TXUidkWZz60GO1ONR3aJQUQwDdG2QnuPdSIzfs/RYE+55SlhKNCI+J
	 LAlp3OQkqQ9+u6EY6FcsVQYkbl3K5WS+xpY2V9azMeGu/Sgsb6hDu2MTscJfUBn0Djw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P+YkhPYS;
	arc=none smtp.remote-ip=74.125.224.97
Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6FC606A331
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6FC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P+YkhPYS
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-67db1f6f50eso482002d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776586; x=1795381386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWIlSlhDqIZVJylV02U3W5JWNr4VF81Iz41rAjFMs+U=;
        b=VeJbNHDsac1oz+tW923RT3dYLN9gHaRy4wZViUNyu0sQvxncPtyO0TRozw0G6hqgt5
         8RMAg7s9iPhXw7ZNOKGYNYuU99zVTpYyvH7q4MCvLmpmDP2q2x1tTcaDLTK588r+S1x3
         FhysVU6jV52TJQrI03ixVr8jXf7wXYltD4A/0hkdp+GjLsGs+qhtIeVaEps5HBmo54Lx
         its2UFg5KCE+q6kOFOtxsBDbJOOn5tj471gj63dUDx8dn/xukSu+KPPjfukfaSssvQMG
         k2NJr7WYyvlCrm6BGQE5x0RJeEu9ZLdN2NRlu5HlTpHuc2kxXHeap2EgumVGqMikm/ux
         ksVg==
X-Forwarded-Encrypted: i=1; AL+hErGJz5HavvnuM2CYHbe00r+L7ohVjDzh74PzNYWIQhtaGsdmDdO4w30KuH51cN6LgEjvb+dRWbpYGwNfVHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mnv11ZgBq0Z/TrAmSEZVHrbulNX46zWFgjsSwfA1+w0chHJSk
	U+0rZDo6VevrubQuKa7jbKDfo0RLEa5W10CGhr9Uh0+sITTBkn84xy+6+iR8cAlyaqf2qUcbZPQ
	07OK0eMdCadubS3G50il5PKQW8Y8scQMUjXpP6VBmOUhS0ozPkkJQr0cwZAntLbF7wt5uF2qJx1
	xwE4O3ZsrhXE7AvrSCnfMddae7UJ8hAceCtdzbe6GNX8PRfjB8KdMjI5/4on5irSqRJRnvJFTsJ
	6gKaOtHX1/S5CJvHLWOW5fvyg==
X-Gm-Gg: AYBFou35op6rN4xoq/8n1OWBtM2Xx+ISYiZY/zBzhsgSIgqj9mwT7SuFtUAD40yagPq
	gJvBx64gEl6Zh2bK42C3XpbrpNmxkBggkxm9HIWf45AqvvZy6PuKmqVRigzn3lXv4sbnUimlrdK
	5DwxmpLEZOPze6BxXmIN2ZCH8PCpDGulqhbqfpT8WycDW+8szSeuHC5iJQRXF2B2ryyF7dlopGi
	dAdYEzBq3+dzJrPxfgKlLrk7LCsWjmYIhNRqygGuU5qKBf2XKLGH0wokQK+CnSw5JR71V6oOU5V
	n4iDkoACi8gfsqnau67wYRGbhZUZjvN1JnpAPu2JhxyUd/lfh9vOUyna3GbxNupMjM8MRFGiK6f
	8qLmPZuo6wsYdPMs/peHqMIxsNuk4cBVzs3tHfxSJmE1Q1rfzc5Dn84WWtID6Uuf+3eExqiX8lP
	MZEsAS3V68r0lDC6p7bAlNQbfp2UL5KwMnxa2SWrw=
X-Received: by 2002:a05:690e:d83:b0:67b:f64e:b323 with SMTP id 956f58d0204a3-67d897f316emr5264842d50.87.1794776585779;
        Sun, 15 Nov 2026 13:03:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67da7102cd2sm25027d50.54.2026.11.15.13.03.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso623959eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776583; x=1795381383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWIlSlhDqIZVJylV02U3W5JWNr4VF81Iz41rAjFMs+U=;
        b=P+YkhPYSzjgtIYqyhXYvAz/rsuK2NUWUM/uibW8+kKIILJa7otHrwhb67uVjZymHUH
         h27G9DUzAuoh43yxm6770OxgT97MZ+ll5/Svyfk8Qi6EQN3Q9U1PgXlcaetHjrEfIr2W
         brWj2nYan2HrFcq+OkM/qMjyRV7kkhM5vpIhI=
X-Forwarded-Encrypted: i=1; AL+hErHHbKaGiV/mhXWnxQR5mYEhlashR0QVgPgGoclh5TNKHZJ1vdlEmAbRdiNLUlZjbutJ8LyVa1gP+9/nsvo=@vger.kernel.org
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr7970685eec.24.1794776583542;
        Sun, 15 Nov 2026 13:03:03 -0800 (PST)
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr7970660eec.24.1794776582638;
        Sun, 15 Nov 2026 13:03:02 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:01 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Vitor Soares <ivitro@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v1] wifi: brcmfmac: skip bus_reset cancel when the work was never initialized
Date: Sun, 15 Nov 2026 22:02:50 +0100
Message-ID: <20261115210253.883721-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020203916.381637-2-ivitro@gmail.com>
References: <20261020203916.381637-2-ivitro@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 20 Oct 2026 21:39:13 +0100, Vitor Soares <ivitro@gmail.com> wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>
> When the firmware request fails, brcmf_pcie_setup() releases its own
> driver, which runs brcmf_pcie_remove() -> brcmf_bus_cancel_reset_work().
> At that point brcmf_alloc() has set bus_if->drvr, but brcmf_attach() has
> not run, so drvr->bus_reset was never INIT_WORK()ed. cancel_work_sync()
> on the zeroed work then trips WARN_ON(!work->func) in __flush_work():

[...]

> brcmf_bus_schedule_reset() already gates on bus_reset.func for this
> reason. Apply the same check on the cancel side.
>
> Reproduced on a BCM43752 PCIe module with the firmware file absent.
> With this change the same failure path completes without the warning.
>
> Fixes: 43b25879f004 ("wifi: brcmfmac: drain bus_reset work on device removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
