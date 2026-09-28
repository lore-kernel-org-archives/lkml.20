Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB634BD346
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607892; cv=none; b=lCOzLQAHDdj8rI/Y69hQTBmmwjeZD9x+XTU+qYE1WMkEBL7yD62Pifd0xiLGkITd33bMpjVoe4HfcYRSL7w5CsU000YboDLcQtDg915rbQ7OTHrV3RMab/cc4J+lS+NI7rqf3AdHfwZDjv+dGTaB0yR/lP69eVsnuMpZ4g2QSjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607892; c=relaxed/simple;
	bh=WjxG34ckArSJvICg7CN7SjHfhCj+djEKUlscplNZg6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBZ1scOkO/VCyhsHw0y+aDyg3Z3mKbOP4YDmQMErdvPtxoiob29MQG2pJ0sVURqlWF1Z7I4pzErJKqVCU3xCbUCz215KKQujNejasO76+E/BvCGD3kFB+crDxrM/Mhbl/1OU9Of0bU1vN6BkJBNcb6NiPNuUM+8CW96JwdKd8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npzbjPdc; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npzbjPdc"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6aae37d33cbso4143379a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790607889; x=1791212689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjxG34ckArSJvICg7CN7SjHfhCj+djEKUlscplNZg6E=;
        b=npzbjPdcl5K5BtmaCtT3jWaY1vNpcIKP5JmWU/+MtqSrpVv74rNw5LVwp/+abH34Ld
         JskcpUiT8p0G+jPlgamW1BcpuT3LiwgGjJhMHuxlPJgYjZU9gYzkmduQ7NjGuSMhJuBP
         R21Di7imKuIi1toLrbQIwwoBU+VTgZXDJxnH2aQ0+dkjguZT2Mh7pbjzP9YJpro2u15P
         PANr2TkxBLHjUYkOT0iWCZRj/RfQ0tCyyOgTCEOuToegEdFYmVbl8w400yIhDm5P4Zec
         8VR4Rt3d5tlG4vH6q5IQtixyb71He4QU6ANJl3bFTE/7pB0xQTX6Y5NSHeSYMuJ1r9TK
         eKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607889; x=1791212689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjxG34ckArSJvICg7CN7SjHfhCj+djEKUlscplNZg6E=;
        b=dWHj8EYcBX0tVsRzouA82BQrHAx4jSFSdwo4EnxgtYQOnOcrW59TSnZOUKOrPgFQ4I
         FY2fYeGaTQfzsxOjraIJSrewqpM2ntb/i14r5H3LHdpyG9WJiTNxfXgTOVS+kRUXEcv+
         xT65K1hIlLhzsVeDoXKNYd+SiVTTM7n/0t2kXtOyAifuq6x/N0PjTxcloU7v/JHiPuA6
         Y9wUModi681KkEocPo7fyY8r0Mg/eTjFUWYHUPnC3JTCRsBCtr/2jGWelQ51AjYdt/G+
         N0FNjJfQRK81cPwtIWVK5WyJeXVno5awzfXCkGKHrUnoV1KeI5wHQUi8g6nfbbbz1B9B
         dVWw==
X-Forwarded-Encrypted: i=1; AKwUvBx2jmHQVlB4DZ2d1Qz2BPNI7s0daeAQEuYd+B5xuMmivjndk6o/3voMFKM5vMLjh/MOeElHWsyw6wCyJi0=@vger.kernel.org
X-Gm-Message-State: AFuF++nJSPvazuTE+axBsGE46n3RGSj0/eS5fwqTeEo2Fg7aOoBW0sJg
	rHAG3i1KrMhOcJ8uo1wmqIliWZWIJ/xOFls2IgaxUyWT3MvckR2Lwko0
X-Gm-Gg: AYBFou3+9s2JG+rJ3a0RoUGhcHwqUsZcBk6d2vxnlMaem0AsXqZP+RpWfR6poEAtu6p
	ULhXe8C136XlU+b/3Br0Ky5GZowCzHF4dKzJVqWk8bVsB2E+rrKwWjjvfDsbdALZpcTkDLfXSAx
	R4zP283JccUI521Yx1WA7KfikVGWumnKlQxVWvu0c3mCWbTwOWFuWjTtzECi+jO8UW4x28HFhQO
	k0QUNIVLDEqhCdqsQpYhBk4HtDuuohASpFw0ICbXU5RcsCGCpmWiQ69G1pszQBef7dbWX8Nym7v
	Ozdi3OWzYvFo7nwnicPpczTQcuAmZB2zX5C7EyXQ6SH52EydZO4t/nofJ3IGh7nCxvZW50PhxIK
	fDI35BMMl2GyppD563vItOjk6o9MGY9k4jf8I5OUMevcjIuhEtzFwE3YOU+mj8R+2cuDrJL1aGa
	TnnrZgsw2N72uqCqACnKDBC9cUpQxHiVtIgCDaq7EE25uMbNisaGJJQlhdBHO1ADLJZ0NdWbS4c
	CRKF4BM7smdc1h/EhT4XGfJdaAk
X-Received: by 2002:a17:907:9689:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c2ac225671amr1087174866b.11.1790607888866;
        Mon, 28 Sep 2026 08:04:48 -0700 (PDT)
Received: from APAPAG-M-7WYW ([185.10.235.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm495522866b.33.2026.09.28.08.04.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 08:04:47 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	bpf@vger.kernel.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tasos.papagiannnis@gmail.com
Subject: Re: [PATCH] mm/nommu: Reject wrapping ranges in access_remote_vm()
Date: Mon, 28 Sep 2026 17:04:46 +0200
Message-ID: <20260928150446.36873-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <arZzn0bwWqp7xTE5@gremlin>
References: <arZzn0bwWqp7xTE5@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> BTW always feel free to nag if you're not getting review! Something things
> get missed. (Though I'd say wait at least a couple weeks before doing
> that!)

Thanks! To be honest, it wasn't clear to me that I should take any futher action
after I received an email that this patch was added to mm-new. But after reading
that email again, this seems to be the case. The patch is still open for reviews.
(Sorry, still learning how the process works..)

[...]

> Seems reasonable to me! So:

> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Should I now send a v2 with those changes? It seems that these are already applied
in https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=1b721712d07e831686de53efc667561985897956.

Thanks,
Anastasios
