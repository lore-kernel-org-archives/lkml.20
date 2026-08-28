Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD9B2D0C63
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895299; cv=pass; b=Ll457ZO+bt8NdluHcHHrP5tbc38nKsZfIWk1fzMoy0jTPhK9KKKBfPXChjiPoPq0/umjjCpCKInkf5DuLusxJGHDt0ZJK/M5Cqzafih6oeeQ4MFIGD149lN/BWyMcD3RFIAdkmDZvT6j40cYTK25wZyb8QmEUfAgcB1tACysDMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895299; c=relaxed/simple;
	bh=sO5dSXBaHvsFXkX2Tziwa0K3ga1aeB/vw+imQuoh05A=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Vs3P4Hjb4ZWDh1NyAgVirELf49QdnXF6XGeNzmHjWd3dQTwYjRPfTxe/LzCLTcS5miG2/i7Zleoe2r/Kplq97hife68STsBn/HOhVBNVrNn4ot4Yg1aOp7rjFiPRodc3Sw4bxYBsgyWYqw9si5vxt6dXndh8YarVbMqGILo/r9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=oPztFiqe; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="oPztFiqe"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so526900a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895298; cv=none;
        d=google.com; s=arc-20260327;
        b=ZCjrvL6NBq7rYZEMAsf8AJ7eXorKX8TkDyKPwWmINnpt/VF/UGnaN5FDf5I8UU9UPt
         LtwemFfdJey7nyKqtrzH6hnsJuF+kefVPg2vtIY2G/19R9Rw2wqCtzqKOooo37lkd5Vd
         Dn7AilQnzB6oSJbeGlpyNRJYVVIAUDmyg/ZEihV54MV9ue/7Wy1gIhv+r40vEnU3MW8T
         snXLySf4f3uC5WlmV7KWod0otb2Y3gkrioFGhyLV8/0L21LGKuJdGDH2ZkBFDfDx4leS
         QgDGNa3Tku8+GCkv7yq4zbNweMta/PNYgOMa65z1o+ep8tM/AlRhwUmWIsfO7F+PMRli
         nHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=MDPyu9NJUwBSIvoRoRLkuEmxgNNfQg32MOjandJIVTk=;
        fh=caDhrU/00dhhZ+HD+agg78qfj9n4KKFSwNGAtIdX8PA=;
        b=PgVkNotsRJd1O4eajeCr/ooZeturnFg5bFWvlOPuMUjwOhHjm41+LLWFor2b8aY+4r
         VIPsWS3jRjS/6ZhUxy/ElswJppvV3hG69TCee1uQkV1PUmgbf5JjvglCXL9Peqslq5H5
         y4g/YgxSZ5S5g89uSREfpvGOGr5pa5Wl0Fl05ZdAzSagwqjO8ZWckOP8kA+MBjP0uclE
         ZVxMY1SPWQYxB5kJs10z4fUpTdI6Elzjr2jLNAWT3AKZs3gMhNmhDLvVt+KY5VmxnRDn
         2tewMBiwRqw8pa+IHrTDYGqG5xwihmOQ1rJMlXmcutkrWi9Lr2ErKhcVGq+EVPtECcvb
         42sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895298; x=1788500098; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MDPyu9NJUwBSIvoRoRLkuEmxgNNfQg32MOjandJIVTk=;
        b=oPztFiqeU2/8NvmWKsButQVdy+hAjB+dV6W2E+EeysZVNDYSc1FjLcLGyaKui3MzUk
         RYP3Cjcv1Jx6E0Ige019QdOz1T3JtvVDk004w4tbB4MWg1S2GCFeBKOeXurIDWIhoojz
         7OzHN5si/8+0+BeMzEzMNNbBzktHkX9Qd2Ww3nq03WkJDLodw7ZeS+f8zxFo2gAh0U3z
         R032LAjXPopmI6YvC4XkOraQj4Hvqhh3zwM5tiAtAW0qi0Z5oTuywClH572L0RA/+SrL
         QyVImnK1IFwb7zO9PNNf7xbJfh9uhgJDKyrunlwvx4WYSXyujC/qij9jBjyhbnDZwktO
         flbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895298; x=1788500098;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MDPyu9NJUwBSIvoRoRLkuEmxgNNfQg32MOjandJIVTk=;
        b=nRDijzzFFUqEyq+xhqGq6OEXQHGeRvj2+xs0zi3uMDF8vvhBm6bxwB9lJxEn7I/syR
         Y2m1D6b1O/yK5wF1YZ8/pcCVoIx8TqbGlHKzL/JYbIWfxOXVR7Z1wVdVMM3/IzE4drqj
         UZqtETWtCje7WwhZT7FaACL2uqM9WIb2UwymFLu5OUXss1RJ9CPuGl9m59l7qP6FL0+H
         kWI+/iUCNMVCv7bVqHxbrH5j4hxkZ80aC11nB+MB93g3dutoCKG0Dmy3U/xsyWEEVS6s
         aaAltvc+oIVbOVLrPXg4Va6m3gp3eQjTL79kcALHZgdyCsABqLtg8eTbzqyJMljcrDWu
         571w==
X-Forwarded-Encrypted: i=1; AHgh+RrEx9T6a89Bm4B7weXC8r+mR+RJHGtHvxHiCDW5YehD6SAYasSjmBlQ4PuazkF5oZFgJE3eAj1X32Jy9K4=@vger.kernel.org
X-Gm-Message-State: AFuF++l3pkw6zlGVNhzJeMNamxKDeQ2sUwElE06w+axqolw05cuVrbaG
	GKkDl8qFFh1ac6YcxpNhSH/T47cERz+oZ6j3BLrRoekzg/8Kd3f2WjvG47LXVDtjFWtsSvJbLsp
	dC8Tol9JquZqUYnA0rSWnMP0xaG4uNXXErdqUfmI/
X-Gm-Gg: AR+sD12TqFMZ9gghDueaBkSFdQEotO4c7B5oX1lwMbBehsUteM9z1bgLenZjOgs5fb9
	NXZGgVjZL8auWOFey274mBUMo4GVGj20nj62kWtqO+NxvRYQclNMcqKRyhjFw5dNaLdLoq/q4zI
	CBIlWu188ZJLr8mNzRlj1aeqAe//NdCPfwElD4xGHaZQHCMbQgM1cp9fH4WynqdybAFipLKHu7p
	rGyCEOoZ2dP1bVLnP6aErfOdYg3ftS6sgzH5PC0XNGrTbBqA+cAPQV7oQ4ICtA29gWDdHrOY3zK
	2FKtqMzTi0R5w5R1qIG41qSxDxIhdsOAp9P5718DYVvlkJjr9QVVgJJfeNtuEDc89zaaxIbPBT+
	/8OLPLVl5DZNS9TeFMQ4/OuISu+Wq82n6LQ==
X-Received: by 2002:a17:90b:4a8c:b0:392:6638:2e6a with SMTP id
 98e67ed59e1d1-396d0f69d10mr7205264a91.13.1787895297054; Thu, 27 Aug 2026
 22:34:57 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:34:56 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:34:56 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:34:56 -0700
X-Gm-Features: AcwNN1Wfzp6gNlZZMQnQaX8vcqcoxNhl1n6Biw_pymg2M1kxA9FjqGACk_v-958
Message-ID: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>
Subject: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
To: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: falemi@asu.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/150-usb-chipidea-foreign-platform_data-oob/

  BUG: KASAN: slab-out-of-bounds in ci_hdrc_add_device+0xb76/0xd10
  Read of size 4 at addr ffff88810e9061c8 by task repro/9505
  Call Trace:
   ci_hdrc_add_device+0xb76/0xd10
   ci_hdrc_usb2_probe+0x22d/0x370
   platform_probe+0xf9/0x190
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   device_driver_attach+0xe0/0x1d0
   bind_store+0x1d0/0x220
   kernfs_fop_write_iter+0x3af/0x540
   vfs_write+0x61d/0xb90
   ksys_write+0x150/0x270

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
