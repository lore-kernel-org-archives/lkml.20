Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBCF42902A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946365; cv=pass; b=KDGXD7JzJQYFhaUE76DVwbUqRg7crX70/KngVO1cdGz+GK4HzpZ2LIaQjtvcuiU764Fj0P5xo479Svw92Y1R8+DoGRkgc6YRX+2qeY86F/sGRx0UdH/grMomuasUHkZzqkd36wjjR1Sd/YT9pyWRFmmuZ/YsYb2b2KBMr/3Cr/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946365; c=relaxed/simple;
	bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqJTQ7nctA8iqjN8F3vUCgY/WfmwhnrTnyaivQYmVj3pQJRcIJptLk6gWz9+kiqNBQ+B9TCyUlzhy4KWKI0Z3QzE+4MGsvZ5rKVAChm2ZNwoAbOWkuEbL8/BOD5Y2c1j8qn/ifTf/6uLNBGdxeQDEUZlRv/UmN8/gW30h2vxldk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pzOJoE/0; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pzOJoE/0"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5732e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790946354; cv=none;
        d=google.com; s=arc-20260327;
        b=rhSNDQPTC0kA6Rwr0LdANUlT9aX4B0pysw2zHAvKTdE91Ykw7aZUQhmVncHiUbaz6A
         kqdS+1ZEr2++3rH9K4AW12WgWZ73XsPEFsyhrs4BdwGq0NRa3hd6IssHN28yL9MqT9Tl
         iuvv13YzGIptonD/a0968PW+NC0xmo/xDLEDWEYGcFeTzwvkiwemPVnvdYzJKV6h9HRN
         0JAxYEtjm3IXIyxWIU9JvECN3qfXyPkD0Xtu1xzBl5yQlkRZ6mRRRPB4Kt96fmHUP19t
         B9RwYoLe7a5/QH/Ma4YPHJBszmt3iIsRUmYe1QYf9haJS2Qpfq+ogDZM3rmq7c/CX7qB
         0Zcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
        fh=Hv+lbTzqUyGDUM6yGIBJwFuQg6eePk9Oap8RfmxUU08=;
        b=M7sAuhSNyqcV4Uwm+spt/U2XCrIo5gJ+ofiFQkEi7j4kwOtbBXeSE5tWvzuxUi9s63
         eL3OiHxhmVqK+wKz5SS9ACDl12p5jigE+2ONzebZn38NzHtcMNhbJ0pjc02r/tfj2pWS
         udAUBrKKrHg5tZMGzMAyVofx8YM89S6u2kUzjzVUhZ0+HDfCqu6FbH8R4M3Fm2E2kbVt
         /aUj22JBBMSOSsBJrQ/CHJO8Biz3RM4z34uW357cgEwZr1AFS5OhZrqgQlVklgQFsBpO
         x1fws6fx0t7eSRDTw/PHUQNTpPO4fb8Og5ewES/Ug0SdmGE+yjVXiekfkefq9tBREnKx
         V1xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790946354; x=1791551154; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
        b=pzOJoE/05ofXcf/NM5ADpf+Tn9P+KJUUJgJMQEgk2Y/R64/A47YD9cDI9s1JArtnPS
         osAN0lat6bBssNC5Xv9K1H8x13KlRaqr6p0kyl6Pa4/2SxfAALJwf4tOSUgyl1D0oXAC
         /2N7swd72npIbFy/9hlnX7SZN+jrzLrrbYZkArbAdSWn4GT2+JZN1RmaxmVkyvw4TJAm
         YiEwMtUoYurkVV/ta3e5xirMpVDpEgIsdIWeM/NJyWSoeCrEPWYD+jv1nOWffnkYZlHC
         quvN0djDkn9tV8wuMRttgNTOCAe4Pgn0j3H7+YIs5EXARvYLZF8wela2+os21dtIWoL2
         5oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946354; x=1791551154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3o9mY11vfyNe7daMSPv/Jpy/COQ66uBOFgs4MlwYzE=;
        b=PbCE8bLHeM8UAtBQAVnwuXgEUiumXrP/DhsDY1JKel6LWBSprdw3u0MnGxikvrKYIr
         mT0xSWE/lS4t2UGWGh09ct4VYA5iwHF7nMbd1Jtz3K5fj367aXpg0XYegu0HpSl7SWbA
         ojNxGqi89qEn23s4zZi5TanGgund9VOSXTwUCDA/ltSjD5WRLlvtNUZXRG27KYDFU+aQ
         g4oR5nq4Ss3NEVTdh67UtbhU64wRUC6XqDnCZ56FYg2q5f1p19tAFjHlIxi+tjxr4iBf
         SBDNpBgp2Lo8RNCt5nSijDHY5Yt1qBosUVgtMKZjZO8q1PQPR9mGcxsi4yWoKwbKqq9f
         hR0g==
X-Forwarded-Encrypted: i=1; AKwUvBzeRIBZ3Wo1t8tkpZ+1h7rvbEk8XnyUmbKD/XfBXtLy4Zp9WpU9PTTPk9y0fZ/EjeLyfN3AJM2mVa+T158=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8h23gs9TmLCt7FyeAzjLOOchugmrLX1iUvyHBJIIOzLRdjvH9
	8HP0g0vDUY8t41e557dY6LqiW7FJvSYUAK5MKV2pNqzNsaMl0Dst4Rc2DJaEv5PhHskpOY24ISC
	qG+lUpbE+GBZSp9Q70Oy79cCyaMjd4C9ipQagB5e2
X-Gm-Gg: AYBFou2uC3frW0K+F8KIByoncf3NSb3ecOEN43StUufu+1RlsUIOB7O1YEyJz5pZilC
	XABLS8Hnuw6Eu83Dpq2WNTi5ETlFrKGBCQGnBYnlRa70o683oh1uyB7W/SkyBNOyFTmpS3muV8d
	yqrL8F3VvoMPVZl0t53EdFhHzLnP801T+0n6YfP27zPbv077vN5dc47uYcAOZIXC9GPdKQXZD4m
	gv0Xw74gAf6u+rl+RSytFuWAoCFc6UBOguvz67le2j39GkZ6DB2kWt5iy19FILNP0bmcLnuepoX
	dRR77MfN43RSVwOODatcaxJA/dcvc2ZuhFtreTI/TAxUJKPCt8zC9AKe+ymjcPyp8LB8EHAJRTl
	nOlTq/L6Yl0LUgw==
X-Received: by 2002:ac2:5b41:0:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5bbe07ff867mr111076e87.9.1790946353509; Fri, 02 Oct 2026
 06:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com> <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org>
In-Reply-To: <86se2o2rbs.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 14:05:17 +0100
X-Gm-Features: AclHuK-8Kjrfe19sfHmKlc-tMXZBvGMWfs-wEUp4fL4Zc1UtRtbnXSXF_N2l_2s
Message-ID: <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 02 Oct 2026 13:57:11 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Just to make sure. Is that what you had in mind?

A diff is worth a thousand words :) Yes, that's it. With that, every
remaining hyp user of vcpu_is_protected() only runs with pKVM, so the
kern_hyp_va() case in the macro can go too.

Cheers,
/fuad
