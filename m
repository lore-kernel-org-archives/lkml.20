Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765DF28315D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886236; cv=none; b=lOLM4u/GHeiahXjLSCDZtHXZEP/5jtXIgBvgIUtKgQMoLg6CA/Khtfn3qHCHePHTdgAC5zhjjT/IuPq2MBq0av48+A3sMihDE4fbSxXOg1oQSQqpEhl0Hz7M/9f6SMqSQ/20zOfP541uZqTx+H6Cg/PLC9XKRlYdIUPN3D3OJhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886236; c=relaxed/simple;
	bh=cPVi0xJfBEiLqCtm3UOfyLxn+P7c3BdOroSZ3AH7Hqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOC00sCBIoORLpjf3PvkWfDTHhpPEY8oUvjOMSkWc39WuQ/VkFT2AtGg6IoQA3CZSmIq/PmO62TJkF70sIdPqgjhteejmGAmrly+lqddWiTk9Y0pJtCzo5BVxvi1RqmecHEDxKbQpiBqU+I110h6mlGA/+RLVrhi+cFQqZJP8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RC4EMiDH; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RC4EMiDH"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so1694999a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789886235; x=1790491035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPVi0xJfBEiLqCtm3UOfyLxn+P7c3BdOroSZ3AH7Hqc=;
        b=RC4EMiDHBv0Fb/J5GP+qlU9ArEm7Kx3E2JbZlSPcErhIRx1cuq8SGaSLoz4nhC0R1v
         /H+9I1rxesKqqVtYVEaHgUSXEezM5lQ0MeO0UDVtluaJaCExe+sinoPJtfiDu6fSvi40
         2feFAOy/SzOObS/hCKTWmaDIkn60jpt2fA9BUJrT0eHHnVi9VYPt2RYm7NwAdJlaU55H
         oFR1vagBFPYMInxJfWnWipzvRRSgajVa4c98VGxUMXhqhrsEFtZmwXKZdYqheovsCvCV
         /3sWb0hdYq5+zeCZGwDL9slQ0UDCbINGMs7uqZsiJVya0VjJstID9UHr59G7+0g6xhr1
         EEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886235; x=1790491035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPVi0xJfBEiLqCtm3UOfyLxn+P7c3BdOroSZ3AH7Hqc=;
        b=hwvID2m0AsXmYk0OnOHzjOVndmHIpzvbHUFpJO+vkyuf40fMyhHEiRyFfNf5U3lU/B
         mksDXGsWO0EnpdruXhO9eXsnABKM2yTaXRuPkt7+rpedkM5qTdUw0U8kw/KQ+G55gaUn
         deuKX7cu8CF10TF0oE6syCo3eYtP1G/LJSffV22dN6AhLz+D3vOVOhWf6OmYbFpprYi5
         cay9JS2jq/4eDipU1muQBV1DlL8GlPpjwVputf9fOW/qDl/xh2/Be0sy9pWHP3agFf9x
         7HhRq8tC9AHi1aA2D+8lkU+LcmbYiXeKi7lb7e4HH7Q+l9NlFmqS87F78A0lI67Wapc9
         e2Gg==
X-Forwarded-Encrypted: i=1; AKwUvBycJJWAdlNGgJFvyR54pyT7+gaJp1/8zDXDHzrZWGNXQ6+GoZGvSfqhMmSJ4gfxPruuiYql1Xw5itVQxpU=@vger.kernel.org
X-Gm-Message-State: AFuF++lkraRSHXNtOjqFNzEGVqMoU83jjKUtOLbRa5a2HQ9Jv01wEQFs
	xjno0lg2MVDRQuNIayEmhkrTMWjBBDl8UQRCHyhaE5dkhxD/tlUSo7ix
X-Gm-Gg: AYBFou1UXWymOt9qkK9QYcmfSs9utPErIMzj2oKHAkg8ABjPPwPlBt0IrMCGUvKaNE7
	Wte2NTjXmffzNR0pqlq1/yqkou0V0yGKQPS2Zk3jr3t8XzH7G4HBH2sVcun9YBR9LeCFs0Eyqi/
	FHBTQ509iOZsDLTjRYTvma+ztzmHzMww3kaiivdea+WgCM4f1O0+2f+UspVM1q9z/YEyZhWQoLQ
	q6UhbSvz8Dw/8fu+tHugurXXQd79Nv0cCKFYU+HLLL0dUlwv1svh6SVNGc1u/AuHNuhLhS9CTva
	LxIfCEe0Nk3sOnRe52PHXJR6hKS2JMR+PeZQBmthX9n8pJDGH3kEMDZ0H2u8TGpM1WFgO34MI6X
	zGkdiB//HQVRbeNFkNr3mMdNLvQQ1jrmx80+Y3tJoEFcub6x7U8gVDhaKEWbDGxWloRe8wraghV
	jh+OFb4vp4TEn+fvVcQYEryrKipYtb683f+VEbruuf8EzFWJTmYdKPdiDAO1VrE8Zbd7Mr8enDo
	Qp4Z0Bz8odMz7eKiZkUqzBarScsfp3OUw==
X-Received: by 2002:a05:6a20:9e4a:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd8c3f80bcmr12893395637.2.1789886234714;
        Sat, 19 Sep 2026 23:37:14 -0700 (PDT)
Received: from archlinux ([223.188.166.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aea2da9sm1666420a12.18.2026.09.19.23.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:37:13 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: baoshuwen2013@outlook.com
Cc: emreleno@gmail.com,
	hansg@kernel.org,
	hello@kursatabayli.dev,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	radheykalra901@gmail.com,
	technosfan14@gmail.com
Subject: Re: [PATCH] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
Date: Sun, 20 Sep 2026 12:06:31 +0530
Message-ID: <20260920063631.142985-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
References: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 19, 2026 at 09:24:25 +0800, Shuwen Bao wrote:
> Add 8F1C to the OMEN thermal profile board list. On this platform
> the EC firmware also arms its own thermal profile revert timer (EC
> offset 0x63, armed with 0x5a when performance is selected) and
> switches back to the balanced profile once it expires, so also add
> the board to omen_timed_thermal_profile_boards in order to have the
> driver clear the timer and set the NOTIMER|TURBO flags when
> switching to the performance profile. Testing further showed that
> this board uses v0 commands, so also add it to
> omen_thermal_profile_force_v0_boards.

Thanks for the patch.

It is slightly unusual to see a board ID ending up in all 3 arrays.
(I believe no other board is present in the base, force v0 and
timed thermal profile simultaneously.)

But, it has been explained well in the commit message and tested,
so it is completely plausible.

Oh, and since the first revision of this patch had a corrupted
patch file (stated by the maintainer), I did apply it to check,
and it works.

LGTM.

Reviewed-by: Suryansh Singh <technosfan14@gmail.com>
