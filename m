Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E262D0629
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920278; cv=none; b=GBwuuRFzNi40PUWNsOr1gDwe801g9o6EHsJ9WtlXLYHbBmxs6jgIzQMfFPSLcRFdq6Ktq9AV/HSM1ygwpQqRqWxdf1VzkJG+GAelFVf0sV7dBSsAbgOKyI/rFRFu3Imw6L5e2Y9tbYSGZ892a3Uz+2ZIB0a/D8XtUtFIbRY2sQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920278; c=relaxed/simple;
	bh=kYyMcfBAAJryqg6SItJAH5OC09qs8Y81k40xs+sQ108=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XERYyTpEOE0W1Wq91oHcLYZikf76WDMPsB2tAsK7hJpIllN1G+LlGammAb3NEPR5WakdgCnFS41KFHAvndlLEgz1jlnSsk49qpTjoxymq0vB5L1F6RRj2svLMjN38SRcn8PWUSRXUXAxZEddoRbJK5mLtw3IU17mX9jGaczmjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoZBGYF1; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoZBGYF1"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b21f09ec76so3554914b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788920275; x=1789525075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HjkNn8pCPk63K+6JY2dF6sJNjHt6m2z8AN7JY+Bxf4=;
        b=eoZBGYF1badvnbFyH1wJ/uFxduL7TliunSFNS/H9DVnxmPD91cYbZq9XrP7VM6W2pn
         Z/6c02LT+E9OMCEJHvwNSElDhiKDqegBciPiPIJPeW5ihv9iVnWGX4s6F23eEZkT7F6g
         4cSaR633ulzquF1pOFBUzTFYhRj9/z11ghejP4Rg0R46+59BJ0PNBoTOz2b2cZiF5PhY
         jy50/q4pPxej3dYAYwcfx7pd9aCJO/Pn7UEDIUAzHVXiWKays6vNL80zO5qYuBPCECX5
         0sm7jc4IGB5rRUhCNpMtjj858lNKBjMHFEc8kej6AY/d4zMAhnfrTpGPisNmTKyWVdm1
         2yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788920275; x=1789525075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HjkNn8pCPk63K+6JY2dF6sJNjHt6m2z8AN7JY+Bxf4=;
        b=DhFKc0qJv2Tgcdk+yj8Wuv/R2+1xoYL0ycx9mxiNAU5qgBwwPTK0JP1vT/35eVx9LN
         WYG7ZNmqxDCKzSyoJgBUTXH/RQDQvpx++ANscR9o3adriVLtQUAGqfDBsu7IGoDBrnvL
         SnzrORwZ8hyPd+eWOHFdyW7+XZIeGOS2LdFEXob2EwbuwOCrypniwRrli8K4qa4ksc5s
         ByuJYWloquQ2Mn3wljGyOxUiM+GeHTmTZNRpG7jZ//Lv6GiYIxEZsGUK4jb7d1+2Bu6E
         zqJBrjkkuSuyq/QiZZYGEree1PHN+uEgUYV77XBftNNupWWtJB4XYETrtHe09K2k0SbE
         nLQg==
X-Forwarded-Encrypted: i=1; AKwUvBx34ZKAiXhLqDGfJIbt/gfJSNtZyvj3ZWHIisibiZ6Fh8GfXsPDLXnPhUiB51xmH29fpcQlkV+MEA5Ovz4=@vger.kernel.org
X-Gm-Message-State: AFuF++kgd2HeKetW2HpBjtInNJzS+E+b7LWsZLPsOLKnJVW1NZG8MuQu
	GM7ITsTRapE22U1hzLwkQGq0cTtsB+bgbpArZ9InRYTtBULoTIlD/Dkp
X-Gm-Gg: AYBFou1e6tlat/u5WoNGs0uBoXPmsytrf8BrWyP8obpNN+I+mqhSfe9Vtj1ZCgXWOwk
	hStz743UCnd4Dz/zRnpgVpHVk1BtFboM+ZZGs0QZH6H+pEErYuS9y+PMIfceZ56FLwLKhl7IVLY
	Z1G5rgK4zUgnh/WEQhv4sU2TGk4FUTcE2xFxlhC3GIUyA2vG/xB+Oi/8dSsy13APu+nE9PBvGyN
	mLSOZBH8E8nU8rBLczGozTHMhdDPa2o5LhaAtkoIjjiAu8k1yqmLcUm5ecwdc27zffOC5TP8UjY
	Vo3H6wa3PRKZj53HW+ea67idylTkYEaE7tJzuPURm9DtZrNWPssmL3RmPr1D4JyA22X0WwUaww0
	Rkbx1HxJa2N9x97jtfm3IgwxVLyeP5/mlfzA7Dyg+apJyVoPAHTD6UsNwLJh4yTubDqF9phNLwb
	USp1CMN5KO9hqepN99gXbOrrfBbdMJ0Nn71oTnngUP7d5SaHw2kxLgvBRQAcUfsAbpphuvZHJY3
	KoidfETNs349so8w2K1TfWp+qQ=
X-Received: by 2002:a05:6820:1891:b0:6be:731b:5544 with SMTP id 006d021491bc7-6be731b5b5amr24160eaf.37.1788920275375;
        Tue, 08 Sep 2026 19:17:55 -0700 (PDT)
Received: from david-hassan-Inspiron-15-3567 ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dea11aeasm18187220eaf.14.2026.09.08.19.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:17:54 -0700 (PDT)
From: Fahmy Hassan <fahmymohammed@gmail.com>
To: helgaas@kernel.org
Cc: bhelgaas@google.com,
	fahmymohammed@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v1] PCI: cpqphp: Check pci_hp_add_bridge() return value
Date: Tue,  8 Sep 2026 20:17:53 -0600
Message-ID: <20260909021753.611668-1-fahmymohammed@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909014143.GA123333@bhelgaas>
References: <20260909014143.GA123333@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 07:41 PM -0600, Bjorn Helgaas wrote:
> The patch doesn't seem to remove the TODO.

Sorry about that -- the patch you received was generated before I
amended the commit to actually include the TODO removal; the archived
patch file was stale on my end, not something dropped from the actual
fix. Fixed in v2.

> There are four other drivers that call pci_hp_add_bridge(), and none
> of them check the return value either.  We should leave it alone or
> fix them all, so the review effort can be applied to all of them at
> once.

Makes sense. I've turned this into a v2 series that checks the return
value the same way in cpqphp, cpcihp, ibmphp, pciehp, and shpchp,
logging via each driver's existing error macro.

One more correction, from an automated review I also got on v1: my
commit message said the failure "goes completely unreported", which
overstated it -- pci_hp_add_bridge() already logs the "no bus number
available" case via pci_err(). It only stays silent for the other
failure path (subordinate bus not created after scanning). Since the
function returns a bare -1 for either case, the caller can't tell
which one happened, so the new per-driver log will occasionally
overlap with that existing message for the bus-number case
specifically. I've reworded the v2 commit messages to describe this
accurately instead.

v2 coming shortly.

Thanks,
Fahmy
