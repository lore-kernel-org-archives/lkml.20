Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E952517A30A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789348129; cv=none; b=g/WvvpU3phaAlM11cTBZf3OXtf3WMLlJsmZeFI6hXtIzMLkAMq64otbrb2JYnUO1bcjT+v33JU9T0do7UolhVxDxFSPB88XlqhHTY2Vws3AD80SFecS0wMPj5+y5qz/B0H8oR4BdDhL9zF7wOotvBMlqqZETiABgNZUjr2FNJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789348129; c=relaxed/simple;
	bh=16vb3KZQWUdtN7Kgg2jXydRCFn/oKzlazujQ/uWCQHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOY+qhoIrmUQDtY0TV0uuFGbiQ4ReiN6yI4v7RZ2198P90wMe4X5lzOWh3Ca+Cm/RIoo2yh8tT29M0pCnwjVQSJylDdoOE5yduqjM7NPr3vz4nrrSiYbuxuporCRlwXrWmwGL6IwsUQZHGRagdUmgk7xNCafRGOI668tjbakPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzvCfaTQ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzvCfaTQ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3072335a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789348127; x=1789952927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pE3zawT4od2ZtheQocZVAYF6r1UYiw8K/mr/U6/fWUY=;
        b=FzvCfaTQ1SJvsYqsWAmVEONU8ue8uCw+0NWD1iC4qyHP0Gr5t7lXKEXzCpNRM2I+C/
         kzujQWvfhtnCDyAzeAgBIWl5GLNXtWkQjrTciber7qPHA7Qrv5zOLJhuCG1bVD+XpHfd
         jrsPaGvXQF2hkIAAN0ACtyDoBMeurCOmX2PQgZWpmnbe0MhgPHfZPPSfK8FJOrhU1gfF
         DLV4wn7weVXUnb4D1ALp4xapJMkdNZ7zMiyWOsw2Iz22nHzChbXU+U92bj+V1cANzL4V
         EQN2eqs/kKMnI3AganCFUY+R04VOdpJncPDZSqCI9wwfPRzK3I37lZPuiZn7twBhgN2N
         cf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789348127; x=1789952927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pE3zawT4od2ZtheQocZVAYF6r1UYiw8K/mr/U6/fWUY=;
        b=UhCsQ8D/JIV/YQLH611XAzKy7mNLDQ5LVHVGJRW3RBVqpEvCPZMMOblvrN/3qLT07s
         zdfpfQBJkvOTgIrL8G75T3i8Y+tRvVhmhG7P2qrIfZsPSCJWqd7EwCo7m/CmmOQ7Jk06
         PK5E+An9rd8aRcfpaCtejO3UKBypLjcLM2Wq86b7qos9XLdmMjanfW9Liy//RoDV44/2
         O+ynhmiCq/R5uEh3TwG8+b1R36omZWggxzzNMnjEA5s8mxugOriZ2xTCdSgGXAmXTJ2H
         eQg+DjqrYw0RA4OSaseWU/oiQ3vM5+csCb8njdHZIbJxScImlQxYkq/8NBMM9WKmOruk
         YV5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmDUOeKGWBLgo/5ZmsEPusYgx+68B9+4KxmXk5qrUAyC/qZViyB5iqPntdbWrfl8kbeRuUBJmNcg2YmNA=@vger.kernel.org
X-Gm-Message-State: AFuF++kOz98jhOMwvzPqAacTNWqQHBFvVgRgsq+moVm+Mz4i2OYSXXQ5
	ORFoMDAJOEkz/bfyosQ0flk0DBEXeubCAB1BXmw+fn+g17IcF++tRTky
X-Gm-Gg: AYBFou3xd4RQPA9HTgOntwZeqW3wB0A99lx5LNGSZqp02igWRgV8zSNfob9GG8vIhKv
	4KEFsICRdXjY6PqEr9yz4J8uz2V9HDKpkPzYEGu3zrPBQJnhfnpapYzdlkfDanEeXOzTaGbDi+4
	BeQUHpIL3RaAdfEP4IKdcarGsbZczSLufhpzqT1XYM0r8pNkhSYzV2bhkNv4EmDt9+EXHYYI3dE
	9VGL7bJ3xFAi9dpro+4dPKZxvzak4nzXJkE4PAuunfntSrRl1nA5vE91Fsnu47Q3wV2Q7Ug5fKy
	YgaPqgPnmZVnp9ibU2RM1yVEwj2SZoXG41qZpxBguog1Obm+GLCRy3eTnTpY4mjFsJD3srOflk4
	xtEO6mpR8QDEn4wTggI5AFGXe5BZdkdifRwsMDKocox0Y2uRoeyLRDW0x8wZy88eqgPlNsJw/Le
	fz+8mIKO+BvDYg48mpUs61WI/DJy47/GRF6SwbcQQfWIGiZOqcVMA55un8B/nQqc08aBoksCK6o
	dZ/aMc1rgI2DJj+K/6FMnMn3iIyhTeENA/d6fRY
X-Received: by 2002:a05:6372:a703:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3db26e544f2mr4658971637.17.1789348127210;
        Sun, 13 Sep 2026 18:08:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a739:376c:7eb4:ea2d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm27453770eec.23.2026.09.13.18.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:08:46 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:08:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Roberts Kursitis <roberts.kursitis@azeron.eu>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] Input: xpad - add support for Azeron devices
Message-ID: <aqdJEeI4gccwzbjO@google.com>
References: <20260906143040.162418-1-roberts.kursitis@azeron.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906143040.162418-1-roberts.kursitis@azeron.eu>

On Sun, Sep 06, 2026 at 05:30:40PM +0300, Roberts Kursitis wrote:
> Azeron controllers (Cyro, Cyborg, Classic/Compact, Cyro Lefty,
> Cyborg II and Keyzen) present a standard Xbox 360 controller
> interface, so they work with the existing xpad driver once their
> USB IDs are added.
> 
> The 0x16d0 vendor ID is a shared block, but this is safe because
> xpad only binds interfaces that match the Xbox 360 signature.
> 
> Tested with an Azeron Keyzen.
> 
> Signed-off-by: Roberts Kursitis <roberts.kursitis@azeron.eu>
> Cc: stable@vger.kernel.org

Applied, thank you.

-- 
Dmitry
