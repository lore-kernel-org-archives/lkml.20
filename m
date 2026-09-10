Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4822947279C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040405; cv=none; b=WIrRURk/SnV3vffW7xuTj/C8tu7cjwjXRg2z3+/pHNzAIpEQvApAb08CqUpNFfPsqg245x6TviMF0I0LG8Te0jCkx8zQL5j8D92r5pa1sSerCHgu9cq2S5NjO7lyOYKNKax1QVFzhMW35AM46Sl8F3WgM5yS3v0wwo/WodsSaf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040405; c=relaxed/simple;
	bh=kMG8DcTNetAun3gP5LCOa1KXZ+QWLUIcC45XOSMAgnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJGf0mx8MX14IGyOE38MBKZ3OZB/Lkfj5hzLiZPhOhwTKAuW0vVVcQHn5cWpbLgfxcC1lHP6i13yocPvoQmLkWosvIXWoda2Q4WC3a3bBRRVQdTyyuMgjVwZ1LjerOj26mQ051AHFnHKj5g0smz1YJAyviK96vArldEY9jrAwVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TR5sjAEA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TR5sjAEA"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-86309e1a213so1934818b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040394; x=1789645194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kMG8DcTNetAun3gP5LCOa1KXZ+QWLUIcC45XOSMAgnY=;
        b=TR5sjAEAnSYRTdy/saZO3UeoziMRlfwot8mzf6gm4P7eVwM/0IxRHx5YLyuKtPLdJB
         IRrB58lr6USUCrgg6TOthzYlWpopy9KoSJ3px5wBeCQqF7Qgzy8rx7aVdTVNgBd0HDpu
         eFEHs0yN1Kk3OO0hFmquuEdMqulQKSAqF4oZ/GFB123IIkwOmsOYyVIri1HLWrfjApCV
         cgwj6tticWKbuzNya/PhLzXUCMYItfadgBUJdOC2by24eTQLghVyv81UzbhSgyoJc3CA
         SIRcI0KfoETIc8jzFfO5zlUTTFJX1gKcfVN/MEZZbUbnlCtUrvnqaJog0zdVTCQ0qT55
         fzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040394; x=1789645194;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMG8DcTNetAun3gP5LCOa1KXZ+QWLUIcC45XOSMAgnY=;
        b=K5IvfGD/zTZ7YT+4CwBYdzQl1oIg0BxmBfN3TOVQfbfnezs15EwL4+5j06rmRNi7+t
         eeQSmo5McJwP9+neoME1MymRnlTqvsHFy7+gaFlaJRGPfc0zbrOqltGvnV/HaKeBW9Fu
         2X+IC5Ne2PIbAM8375Sc+970SVIKM2JLism75lg8VNeBEKbbg6W+jtiyfdymV3Tf7o/d
         mzNtNRp3mSnk2yU3wdi42uvgmZQkoEObymBMS28wkCo1Hqd52HyjofJGJVqUd2j508dt
         hA2EpmLZn+c9kHWpUJHeOYDxyA++18X6qBWqfLNJ0vKT+WopH9wuP6qklqot+de1mPL3
         NiDw==
X-Forwarded-Encrypted: i=1; AKwUvBxA9ZxHwWYbJaMpP6xJR4aNgHJL2b6IVyrfTNOJVOGKPM9Q3tn/Zr7D8JgWCURz9Zp3PZrPgeCakhljNA4=@vger.kernel.org
X-Gm-Message-State: AFuF++mFURcOkyqupASSRmroczNEs7fldyrIcME/HPR09zWn+V5w9fKh
	HDjbQB29LJ3yWe2tO9V/vaI2wL9NRGH1CvHuToF/FwMB6h1pk3ByZIz8
X-Gm-Gg: AYBFou1RSnqpJ8r82bzFInAVzOT0vzh/fKuGyt9jumCpFs6tYrqR25HKLR7F4615+/A
	auPd3VpRrNxvvzSnR7I7Okd3FQo/LwsGo8RcPETt6L8/gLTpf5YxOReQb3MvBUREUOxWS0qwsEa
	KbgOQt49ZOia10qBBOZ7Z6XOnLVfgV3+lIHSxx/5dyapMUNMLv4hLXuIMJkt9elcDtZuwHQDTbY
	otkKeceEmqUjkSP+KiGoDy2WlWspvWSmz6DaJsM2jBhqV8YHT8r/85/bzdNHaOZSomWOHIiM+z3
	Kidi7uTfxnLuJFf4ujwi++WbFxK9wm3dXjwcXbsXQ+UZEFiAPNuiATGtnE9+mH2RTQJbasvF/fd
	AobLfsdB6MSQ7Qx2IGirhP74eAAV80IOSTDUQWEmelF0PmHwTcK8QcBvR/FD9QU7ChQPRhjhx7o
	UGQymtepOxHRNe0Q6alxIBu3s1l3P4giqUrvUG7ibLt76u0jxd557isIJyqIQtkz+naeZVtfztY
	sdZQsk7Xftr8pMoqt+STNFo3WcUjllQRpW2sRJ3KXCzjCm/MD2oWbcAzIFVHSMVLi4Hy15N+ym6
	SHlujGiGGX6JpSk99oKPHf8UiOIWmK/7KUlB
X-Received: by 2002:a05:6a00:22d0:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-861679a45dbmr51392604b3a.1.1789040391943;
        Thu, 10 Sep 2026 04:39:51 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86ad03aaab8sm8410b3a.24.2026.09.10.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:39:51 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Thu, 10 Sep 2026 20:38:43 +0900
Message-ID: <20260910113946.1546390-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910133204.3157f83b.michal.pecio@gmail.com>
References: <20260910133204.3157f83b.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Michal,

Sorry, I do not know why the attachment did not go through. Pasting
the full log below instead.

Thanks for explaining the ep 3 vs ep 4 numbering, that makes sense.

------------------------------------------------------------
 9月 08 19:38:42.677393 rikka kernel: xhci_hcd 0000:77:00.0: Stalled endpoint for slot 1 ep 2
 9月 08 19:38:42.677633 rikka kernel: xhci_hcd 0000:77:00.0: Hard-reset ep 2, slot 1
 9月 08 19:38:42.677708 rikka kernel: xhci_hcd 0000:77:00.0: Stalled endpoint for slot 1 ep 2
 9月 08 19:38:42.677778 rikka kernel: xhci_hcd 0000:77:00.0: Hard-reset ep 2, slot 1
 9月 08 19:38:42.745480 rikka kernel: xhci_hcd 0000:77:00.0: Stalled endpoint for slot 1 ep 2
 9月 08 19:38:42.745633 rikka kernel: xhci_hcd 0000:77:00.0: Hard-reset ep 2, slot 1
 9月 08 19:38:42.861346 rikka kernel: xhci_hcd 0000:77:00.0: Stalled endpoint for slot 1 ep 2
 9月 08 19:38:42.861498 rikka kernel: xhci_hcd 0000:77:00.0: Hard-reset ep 2, slot 1
 9月 08 19:39:14.544056 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.544397 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.550030 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.550132 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.558133 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.558231 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.566281 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.566444 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.574491 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.574595 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.584054 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.584208 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.594040 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.594186 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.600925 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.600992 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.611568 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.611701 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.624774 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.624916 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.643303 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.643403 rikka kernel: xhci_hcd 0000:77:00.0: Soft-reset ep 3, slot 1
 9月 08 19:39:14.652813 rikka kernel: xhci_hcd 0000:77:00.0: Transfer error for slot 1 ep 3 on endpoint at ffffd140425178e0 resid 23552
 9月 08 19:39:14.652898 rikka kernel: xhci_hcd 0000:77:00.0: event ring:
 9月 08 19:39:14.652971 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0000: TRB 00000000fffc07d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653034 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0010: TRB 00000000fffc07e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653099 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0020: TRB 00000000fffc1d10 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653161 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0030: TRB 00000000fffc07f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653225 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0040: TRB 00000000fffc0800 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653286 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0050: TRB 00000000fffc1d20 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653346 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0060: TRB 00000000fffc0810 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653406 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0070: TRB 00000000fffc0820 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653465 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0080: TRB 00000000fffc1d30 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653526 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0090: TRB 00000000fffc0830 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653586 rikka kernel: xhci_hcd 0000:77:00.0: ffffd00a0: TRB 00000000fffc0840 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653647 rikka kernel: xhci_hcd 0000:77:00.0: ffffd00b0: TRB 00000000fffc1d40 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653705 rikka kernel: xhci_hcd 0000:77:00.0: ffffd00c0: TRB 00000000fffc0850 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653767 rikka kernel: xhci_hcd 0000:77:00.0: ffffd00d0: TRB 00000000fffc0860 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653832 rikka kernel: xhci_hcd 0000:77:00.0: ffffd00e0: TRB 00000000fffc1d50 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653891 rikka kernel: xhci_hcd 0000:77:00.0: ffffd00f0: TRB 00000000fffc0870 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.653948 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0100: TRB 00000000fffc0880 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654008 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0110: TRB 00000000fffc1d60 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654073 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0120: TRB 00000000fffc0890 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654136 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0130: TRB 00000000fffc08a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654197 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0140: TRB 00000000fffc1d70 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654257 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0150: TRB 00000000fffc08b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654316 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0160: TRB 00000000fffc08c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654377 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0170: TRB 00000000fffc1d80 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654437 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0180: TRB 00000000fffc08d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654496 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0190: TRB 00000000fffc08e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654556 rikka kernel: xhci_hcd 0000:77:00.0: ffffd01a0: TRB 00000000fffc1d90 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654615 rikka kernel: xhci_hcd 0000:77:00.0: ffffd01b0: TRB 00000000fffc08f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654674 rikka kernel: xhci_hcd 0000:77:00.0: ffffd01c0: TRB 00000000fffc0900 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654735 rikka kernel: xhci_hcd 0000:77:00.0: ffffd01d0: TRB 00000000fffc1da0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654793 rikka kernel: xhci_hcd 0000:77:00.0: ffffd01e0: TRB 00000000fffc0910 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654852 rikka kernel: xhci_hcd 0000:77:00.0: ffffd01f0: TRB 00000000fffc0920 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654911 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0200: TRB 00000000fffc1db0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.654970 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0210: TRB 00000000fffc0930 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655030 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0220: TRB 00000000fffc0940 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655088 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0230: TRB 00000000fffc1dc0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655150 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0240: TRB 00000000fffc0950 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655209 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0250: TRB 00000000fffc0960 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655270 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0260: TRB 00000000fffc1dd0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655328 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0270: TRB 00000000fffc0970 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655388 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0280: TRB 00000000fffc0980 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655448 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0290: TRB 00000000fffc1de0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655506 rikka kernel: xhci_hcd 0000:77:00.0: ffffd02a0: TRB 00000000fffc0990 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655566 rikka kernel: xhci_hcd 0000:77:00.0: ffffd02b0: TRB 00000000fffc09a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655626 rikka kernel: xhci_hcd 0000:77:00.0: ffffd02c0: TRB 00000000fffc1df0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655685 rikka kernel: xhci_hcd 0000:77:00.0: ffffd02d0: TRB 00000000fffc09b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655742 rikka kernel: xhci_hcd 0000:77:00.0: ffffd02e0: TRB 00000000fffc09c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655800 rikka kernel: xhci_hcd 0000:77:00.0: ffffd02f0: TRB 00000000fffc1e00 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655862 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0300: TRB 00000000fffc09d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655920 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0310: TRB 00000000fffc09e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.655976 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0320: TRB 00000000fffc1e10 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656035 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0330: TRB 00000000fffc09f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656094 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0340: TRB 00000000fffc0a00 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656152 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0350: TRB 00000000fffc1e20 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656210 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0360: TRB 00000000fffc0a10 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656269 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0370: TRB 00000000fffc0a20 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656327 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0380: TRB 00000000fffc1e30 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656386 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0390: TRB 00000000fffc0a30 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656444 rikka kernel: xhci_hcd 0000:77:00.0: ffffd03a0: TRB 00000000fffc0a40 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656504 rikka kernel: xhci_hcd 0000:77:00.0: ffffd03b0: TRB 00000000fffc1e40 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656561 rikka kernel: xhci_hcd 0000:77:00.0: ffffd03c0: TRB 00000000fffc0a50 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656619 rikka kernel: xhci_hcd 0000:77:00.0: ffffd03d0: TRB 00000000fffc0a60 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656677 rikka kernel: xhci_hcd 0000:77:00.0: ffffd03e0: TRB 00000000fffc1e50 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656736 rikka kernel: xhci_hcd 0000:77:00.0: ffffd03f0: TRB 00000000fffc0a70 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656793 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0400: TRB 00000000fffc0a80 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656851 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0410: TRB 00000000fffc1e60 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656908 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0420: TRB 00000000fffc0a90 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.656967 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0430: TRB 00000000fffc0aa0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657023 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0440: TRB 00000000fffc1e70 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657081 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0450: TRB 00000000fffc0ab0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657142 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0460: TRB 00000000fffc0ac0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657201 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0470: TRB 00000000fffc1e80 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657258 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0480: TRB 00000000fffc0ad0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657317 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0490: TRB 00000000fffc0ae0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657381 rikka kernel: xhci_hcd 0000:77:00.0: ffffd04a0: TRB 00000000fffc1e90 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657439 rikka kernel: xhci_hcd 0000:77:00.0: ffffd04b0: TRB 00000000fffc0af0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657497 rikka kernel: xhci_hcd 0000:77:00.0: ffffd04c0: TRB 00000000fffc0b00 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657556 rikka kernel: xhci_hcd 0000:77:00.0: ffffd04d0: TRB 00000000fffc1ea0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657613 rikka kernel: xhci_hcd 0000:77:00.0: ffffd04e0: TRB 00000000fffc0b10 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657674 rikka kernel: xhci_hcd 0000:77:00.0: ffffd04f0: TRB 00000000fffc0b20 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657734 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0500: TRB 00000000fffc1eb0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657792 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0510: TRB 00000000fffc0b30 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657850 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0520: TRB 00000000fffc0b40 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657905 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0530: TRB 00000000fffc1ec0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.657962 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0540: TRB 00000000fffc0b50 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658019 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0550: TRB 00000000fffc0b60 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658077 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0560: TRB 00000000fffc1ed0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658134 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0570: TRB 00000000fffc0b70 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658198 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0580: TRB 00000000fffc0b80 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658258 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0590: TRB 00000000fffc1ee0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658316 rikka kernel: xhci_hcd 0000:77:00.0: ffffd05a0: TRB 00000000fffc0b90 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658375 rikka kernel: xhci_hcd 0000:77:00.0: ffffd05b0: TRB 00000000fffc0ba0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658432 rikka kernel: xhci_hcd 0000:77:00.0: ffffd05c0: TRB 00000000fffc1ef0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658491 rikka kernel: xhci_hcd 0000:77:00.0: ffffd05d0: TRB 00000000fffc0bb0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658549 rikka kernel: xhci_hcd 0000:77:00.0: ffffd05e0: TRB 00000000fffc0bc0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658606 rikka kernel: xhci_hcd 0000:77:00.0: ffffd05f0: TRB 00000000fffc1f00 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658664 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0600: TRB 00000000fffc0bd0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658725 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0610: TRB 00000000fffc1f10 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658784 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0620: TRB 00000000fffc1f20 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658840 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0630: TRB 00000000fffc0be0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658897 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0640: TRB 00000000fffc0bf0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.658955 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0650: TRB 00000000fffc1f30 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659012 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0660: TRB 00000000fffc0c00 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659070 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0670: TRB 00000000fffc0c10 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659130 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0680: TRB 00000000fffc1f40 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659187 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0690: TRB 00000000fffc0c20 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659247 rikka kernel: xhci_hcd 0000:77:00.0: ffffd06a0: TRB 00000000fffc0c30 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659305 rikka kernel: xhci_hcd 0000:77:00.0: ffffd06b0: TRB 00000000fffc1f50 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659364 rikka kernel: xhci_hcd 0000:77:00.0: ffffd06c0: TRB 00000000fffc0c40 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659420 rikka kernel: xhci_hcd 0000:77:00.0: ffffd06d0: TRB 00000000fffc0c50 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659478 rikka kernel: xhci_hcd 0000:77:00.0: ffffd06e0: TRB 00000000fffc1f60 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659536 rikka kernel: xhci_hcd 0000:77:00.0: ffffd06f0: TRB 00000000fffc0c60 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659596 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0700: TRB 00000000fffc0c70 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659654 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0710: TRB 00000000fffc1f70 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659709 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0720: TRB 00000000fffc0c80 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659769 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0730: TRB 00000000fffc0c90 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659827 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0740: TRB 00000000fffc1f80 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659885 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0750: TRB 00000000fffc0ca0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.659945 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0760: TRB 00000000fffc0cb0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660005 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0770: TRB 00000000fffc1f90 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660063 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0780: TRB 00000000fffc0cc0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660121 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0790: TRB 00000000fffc0cd0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660178 rikka kernel: xhci_hcd 0000:77:00.0: ffffd07a0: TRB 00000000fffc1fa0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660235 rikka kernel: xhci_hcd 0000:77:00.0: ffffd07b0: TRB 00000000fffc0ce0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660294 rikka kernel: xhci_hcd 0000:77:00.0: ffffd07c0: TRB 00000000fffc0cf0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660351 rikka kernel: xhci_hcd 0000:77:00.0: ffffd07d0: TRB 00000000fffc1fb0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660411 rikka kernel: xhci_hcd 0000:77:00.0: ffffd07e0: TRB 00000000fffc0d00 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660472 rikka kernel: xhci_hcd 0000:77:00.0: ffffd07f0: TRB 00000000fffc0d10 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660528 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0800: TRB 00000000fffc1fc0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660587 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0810: TRB 00000000fffc0d20 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660644 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0820: TRB 00000000fffc0d30 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660704 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0830: TRB 00000000fffc1fd0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660764 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0840: TRB 00000000fffc0d40 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660824 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0850: TRB 00000000fffc0d50 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660884 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0860: TRB 00000000fffc1fe0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.660943 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0870: TRB 00000000fffc0d60 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661001 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0880: TRB 00000000fffc0d70 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661060 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0890: TRB 00000000fffc2000 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661118 rikka kernel: xhci_hcd 0000:77:00.0: ffffd08a0: TRB 00000000fffc0d80 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661178 rikka kernel: xhci_hcd 0000:77:00.0: ffffd08b0: TRB 00000000fffc0d90 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661236 rikka kernel: xhci_hcd 0000:77:00.0: ffffd08c0: TRB 00000000fffc2010 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661298 rikka kernel: xhci_hcd 0000:77:00.0: ffffd08d0: TRB 00000000fffc0da0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661355 rikka kernel: xhci_hcd 0000:77:00.0: ffffd08e0: TRB 00000000fffc0db0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661411 rikka kernel: xhci_hcd 0000:77:00.0: ffffd08f0: TRB 00000000fffc2020 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661471 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0900: TRB 00000000fffc0dc0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661529 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0910: TRB 00000000fffc0dd0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661587 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0920: TRB 00000000fffc2030 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661646 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0930: TRB 00000000fffc0de0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661702 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0940: TRB 00000000fffc0df0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661761 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0950: TRB 00000000fffc2040 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661819 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0960: TRB 00000000fffc0e00 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661876 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0970: TRB 00000000fffc0e10 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661935 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0980: TRB 00000000fffc2050 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.661992 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0990: TRB 00000000fffc0e20 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662049 rikka kernel: xhci_hcd 0000:77:00.0: ffffd09a0: TRB 00000000fffc0e30 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662108 rikka kernel: xhci_hcd 0000:77:00.0: ffffd09b0: TRB 00000000fffc2060 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662167 rikka kernel: xhci_hcd 0000:77:00.0: ffffd09c0: TRB 00000000fffc0e40 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662225 rikka kernel: xhci_hcd 0000:77:00.0: ffffd09d0: TRB 00000000fffc0e50 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662283 rikka kernel: xhci_hcd 0000:77:00.0: ffffd09e0: TRB 00000000fffc2070 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662341 rikka kernel: xhci_hcd 0000:77:00.0: ffffd09f0: TRB 00000000fffc0e60 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662400 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a00: TRB 00000000fffc2080 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662457 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a10: TRB 00000000fffc2090 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662513 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a20: TRB 00000000fffc0e70 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662570 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a30: TRB 00000000fffc0e80 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662631 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a40: TRB 00000000fffc20a0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662689 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a50: TRB 00000000fffc0e90 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662747 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a60: TRB 00000000fffc0ea0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662805 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a70: TRB 00000000fffc20b0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662862 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a80: TRB 00000000fffc0eb0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662918 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0a90: TRB 00000000fffc0ec0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.662974 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0aa0: TRB 00000000fffc20c0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663032 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ab0: TRB 00000000fffc0ed0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663088 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ac0: TRB 00000000fffc0ee0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663146 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ad0: TRB 00000000fffc20d0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663202 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ae0: TRB 00000000fffc0ef0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663257 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0af0: TRB 00000000fffc0f00 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663314 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b00: TRB 00000000fffc20e0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663370 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b10: TRB 00000000fffc0f10 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663428 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b20: TRB 00000000fffc0f20 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663486 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b30: TRB 00000000fffc20f0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663544 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b40: TRB 00000000fffc0f30 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663603 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b50: TRB 00000000fffc0f40 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663660 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b60: TRB 00000000fffc2100 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663717 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b70: TRB 00000000fffc0f50 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663774 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b80: TRB 00000000fffc0f60 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663832 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0b90: TRB 00000000fffc2110 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663888 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ba0: TRB 00000000fffc0f70 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.663943 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0bb0: TRB 00000000fffc0f80 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664000 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0bc0: TRB 00000000fffc2120 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664065 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0bd0: TRB 00000000fffc0f90 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664123 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0be0: TRB 00000000fffc0fa0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664178 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0bf0: TRB 00000000fffc2130 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664236 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c00: TRB 00000000fffc0fb0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664293 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c10: TRB 00000000fffc0fc0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664350 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c20: TRB 00000000fffc2140 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664406 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c30: TRB 00000000fffc0fd0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664464 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c40: TRB 00000000fffc0fe0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664522 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c50: TRB 00000000fffc2150 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664577 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c60: TRB 00000000fffbf000 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664635 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c70: TRB 00000000fffc2160 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664692 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c80: TRB 00000000fffc2170 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664753 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0c90: TRB 00000000fffbf010 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664809 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ca0: TRB 00000000fffbf020 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664864 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0cb0: TRB 00000000fffc2180 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664922 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0cc0: TRB 00000000fffbf030 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.664980 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0cd0: TRB 00000000fffbf040 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665036 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ce0: TRB 00000000fffc2190 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665091 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0cf0: TRB 00000000fffbf050 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665150 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d00: TRB 00000000fffbf060 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665208 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d10: TRB 00000000fffc21a0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665264 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d20: TRB 00000000fffbf070 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665324 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d30: TRB 00000000fffbf080 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665381 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d40: TRB 00000000fffc21b0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665438 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d50: TRB 00000000fffbf090 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665495 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d60: TRB 00000000fffbf0a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665552 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d70: TRB 00000000fffc21c0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665612 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d80: TRB 00000000fffbf0b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665671 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0d90: TRB 00000000fffbf0c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665729 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0da0: TRB 00000000fffc21d0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665787 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0db0: TRB 00000000fffbf0d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665844 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0dc0: TRB 00000000fffbf0e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665903 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0dd0: TRB 00000000fffc21e0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.665961 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0de0: TRB 00000000fffbf0f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666021 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0df0: TRB 00000000fffbf100 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666079 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e00: TRB 00000000fffc21f0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666138 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e10: TRB 00000000fffbf110 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666192 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e20: TRB 00000000fffbf120 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666250 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e30: TRB 00000000fffc2200 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666307 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e40: TRB 00000000fffbf130 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666364 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e50: TRB 00000000fffbf140 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666421 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e60: TRB 00000000fffc2210 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666477 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e70: TRB 00000000fffbf150 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666538 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e80: TRB 00000000fffbf160 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666595 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0e90: TRB 00000000fffc2220 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666652 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ea0: TRB 00000000fffbf170 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666708 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0eb0: TRB 00000000fffbf180 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666766 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ec0: TRB 00000000fffc2230 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666822 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ed0: TRB 00000000fffbf190 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666881 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ee0: TRB 00000000fffbf1a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666941 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ef0: TRB 00000000fffc2240 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.666995 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f00: TRB 00000000fffbf1b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667054 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f10: TRB 00000000fffbf1c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667110 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f20: TRB 00000000fffc2250 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667165 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f30: TRB 00000000fffbf1d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667220 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f40: TRB 00000000fffbf1e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667279 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f50: TRB 00000000fffc2260 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667337 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f60: TRB 00000000fffbf1f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667397 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f70: TRB 00000000fffbf200 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667455 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f80: TRB 00000000fffc2270 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667512 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0f90: TRB 00000000fffbf210 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667568 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0fa0: TRB 00000000fffbf220 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667626 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0fb0: TRB 00000000fffc2280 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667683 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0fc0: TRB 00000000fffbf230 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667742 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0fd0: TRB 00000000fffbf240 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667801 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0fe0: TRB 00000000fffc2290 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667858 rikka kernel: xhci_hcd 0000:77:00.0: ffffd0ff0: TRB 00000000fffbf250 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667914 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0000: TRB 00000000fffbf260 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.667971 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0010: TRB 00000000fffc22a0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668029 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0020: TRB 00000000fffbf270 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668084 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0030: TRB 00000000fffbf280 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668142 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0040: TRB 00000000fffc22b0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668198 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0050: TRB 00000000fffbf290 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668255 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0060: TRB 00000000fffbf2a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668311 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0070: TRB 00000000fffc22c0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668367 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0080: TRB 00000000fffbf2b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668424 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0090: TRB 00000000fffbf2c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668481 rikka kernel: xhci_hcd 0000:77:00.0: ffffc00a0: TRB 00000000fffc22d0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668537 rikka kernel: xhci_hcd 0000:77:00.0: ffffc00b0: TRB 00000000fffbf2d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668593 rikka kernel: xhci_hcd 0000:77:00.0: ffffc00c0: TRB 00000000fffbf2e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668649 rikka kernel: xhci_hcd 0000:77:00.0: ffffc00d0: TRB 00000000fffc22e0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668706 rikka kernel: xhci_hcd 0000:77:00.0: ffffc00e0: TRB 00000000fffbf2f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668766 rikka kernel: xhci_hcd 0000:77:00.0: ffffc00f0: TRB 00000000fffbf300 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668825 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0100: TRB 00000000fffc22f0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668882 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0110: TRB 00000000fffbf310 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668940 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0120: TRB 00000000fffbf320 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.668998 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0130: TRB 00000000fffc2300 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669054 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0140: TRB 00000000fffbf330 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669110 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0150: TRB 00000000fffbf340 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669168 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0160: TRB 00000000fffc2310 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669224 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0170: TRB 00000000fffbf350 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669280 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0180: TRB 00000000fffbf360 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669337 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0190: TRB 00000000fffc2320 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669395 rikka kernel: xhci_hcd 0000:77:00.0: ffffc01a0: TRB 00000000fffbf370 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669450 rikka kernel: xhci_hcd 0000:77:00.0: ffffc01b0: TRB 00000000fffbf380 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669509 rikka kernel: xhci_hcd 0000:77:00.0: ffffc01c0: TRB 00000000fffc2330 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669567 rikka kernel: xhci_hcd 0000:77:00.0: ffffc01d0: TRB 00000000fffbf390 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669623 rikka kernel: xhci_hcd 0000:77:00.0: ffffc01e0: TRB 00000000fffbf3a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669680 rikka kernel: xhci_hcd 0000:77:00.0: ffffc01f0: TRB 00000000fffc2340 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669736 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0200: TRB 00000000fffbf3b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669793 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0210: TRB 00000000fffbf3c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669853 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0220: TRB 00000000fffc2350 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669909 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0230: TRB 00000000fffbf3d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.669969 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0240: TRB 00000000fffbf3e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670029 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0250: TRB 00000000fffc2360 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670088 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0260: TRB 00000000fffbf3f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670144 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0270: TRB 00000000fffbf400 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670204 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0280: TRB 00000000fffc2370 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670263 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0290: TRB 00000000fffbf410 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670318 rikka kernel: xhci_hcd 0000:77:00.0: ffffc02a0: TRB 00000000fffc2380 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670375 rikka kernel: xhci_hcd 0000:77:00.0: ffffc02b0: TRB 00000000fffc2390 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670431 rikka kernel: xhci_hcd 0000:77:00.0: ffffc02c0: TRB 00000000fffbf420 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670488 rikka kernel: xhci_hcd 0000:77:00.0: ffffc02d0: TRB 00000000fffbf430 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670545 rikka kernel: xhci_hcd 0000:77:00.0: ffffc02e0: TRB 00000000fffc23a0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670600 rikka kernel: xhci_hcd 0000:77:00.0: ffffc02f0: TRB 00000000fffbf440 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670657 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0300: TRB 00000000fffbf450 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670720 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0310: TRB 00000000fffc23b0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670776 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0320: TRB 00000000fffbf460 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670833 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0330: TRB 00000000fffbf470 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670890 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0340: TRB 00000000fffc23c0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.670950 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0350: TRB 00000000fffbf480 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671009 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0360: TRB 00000000fffbf490 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671064 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0370: TRB 00000000fffc23d0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671120 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0380: TRB 00000000fffbf4a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671178 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0390: TRB 00000000fffbf4b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671234 rikka kernel: xhci_hcd 0000:77:00.0: ffffc03a0: TRB 00000000fffc23e0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671290 rikka kernel: xhci_hcd 0000:77:00.0: ffffc03b0: TRB 00000000fffbf4c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671347 rikka kernel: xhci_hcd 0000:77:00.0: ffffc03c0: TRB 00000000fffbf4d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671404 rikka kernel: xhci_hcd 0000:77:00.0: ffffc03d0: TRB 00000000fffc23f0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671462 rikka kernel: xhci_hcd 0000:77:00.0: ffffc03e0: TRB 00000000fffbf4e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671517 rikka kernel: xhci_hcd 0000:77:00.0: ffffc03f0: TRB 00000000fffbf4f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671575 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0400: TRB 00000000fffc2400 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671631 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0410: TRB 00000000fffbf500 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671687 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0420: TRB 00000000fffbf510 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671744 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0430: TRB 00000000fffc2410 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671801 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0440: TRB 00000000fffbf520 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671856 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0450: TRB 00000000fffbf530 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671912 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0460: TRB 00000000fffc2420 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.671969 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0470: TRB 00000000fffbf540 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672025 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0480: TRB 00000000fffbf550 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672081 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0490: TRB 00000000fffc2430 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672137 rikka kernel: xhci_hcd 0000:77:00.0: ffffc04a0: TRB 00000000fffbf560 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672194 rikka kernel: xhci_hcd 0000:77:00.0: ffffc04b0: TRB 00000000fffbf570 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672252 rikka kernel: xhci_hcd 0000:77:00.0: ffffc04c0: TRB 00000000fffc2440 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672310 rikka kernel: xhci_hcd 0000:77:00.0: ffffc04d0: TRB 00000000fffbf580 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672365 rikka kernel: xhci_hcd 0000:77:00.0: ffffc04e0: TRB 00000000fffbf590 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672423 rikka kernel: xhci_hcd 0000:77:00.0: ffffc04f0: TRB 00000000fffc2450 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672479 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0500: TRB 00000000fffbf5a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672535 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0510: TRB 00000000fffbf5b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672591 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0520: TRB 00000000fffc2460 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672648 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0530: TRB 00000000fffbf5c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672705 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0540: TRB 00000000fffbf5d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672760 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0550: TRB 00000000fffc2470 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672816 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0560: TRB 00000000fffbf5e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672871 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0570: TRB 00000000fffbf5f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672927 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0580: TRB 00000000fffc2480 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.672984 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0590: TRB 00000000fffbf600 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673040 rikka kernel: xhci_hcd 0000:77:00.0: ffffc05a0: TRB 00000000fffbf610 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673096 rikka kernel: xhci_hcd 0000:77:00.0: ffffc05b0: TRB 00000000fffc2490 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673153 rikka kernel: xhci_hcd 0000:77:00.0: ffffc05c0: TRB 00000000fffbf620 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673208 rikka kernel: xhci_hcd 0000:77:00.0: ffffc05d0: TRB 00000000fffbf630 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673267 rikka kernel: xhci_hcd 0000:77:00.0: ffffc05e0: TRB 00000000fffc24a0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673324 rikka kernel: xhci_hcd 0000:77:00.0: ffffc05f0: TRB 00000000fffbf640 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673380 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0600: TRB 00000000fffbf650 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673435 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0610: TRB 00000000fffc24b0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673492 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0620: TRB 00000000fffbf660 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673547 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0630: TRB 00000000fffbf670 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673603 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0640: TRB 00000000fffc24c0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673658 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0650: TRB 00000000fffbf680 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673715 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0660: TRB 00000000fffbf690 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673772 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0670: TRB 00000000fffc24d0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673829 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0680: TRB 00000000fffbf6a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673887 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0690: TRB 00000000fffbf6b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.673944 rikka kernel: xhci_hcd 0000:77:00.0: ffffc06a0: TRB 00000000fffc24e0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674001 rikka kernel: xhci_hcd 0000:77:00.0: ffffc06b0: TRB 00000000fffbf6c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674059 rikka kernel: xhci_hcd 0000:77:00.0: ffffc06c0: TRB 00000000fffbf6d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674118 rikka kernel: xhci_hcd 0000:77:00.0: ffffc06d0: TRB 00000000fffc24f0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674175 rikka kernel: xhci_hcd 0000:77:00.0: ffffc06e0: TRB 00000000fffbf6e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674230 rikka kernel: xhci_hcd 0000:77:00.0: ffffc06f0: TRB 00000000fffbf6f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674287 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0700: TRB 00000000fffc2500 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674345 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0710: TRB 00000000fffbf700 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674401 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0720: TRB 00000000fffbf710 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674458 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0730: TRB 00000000fffc2510 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674514 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0740: TRB 00000000fffbf720 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674571 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0750: TRB 00000000fffbf730 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674628 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0760: TRB 00000000fffc2520 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674684 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0770: TRB 00000000fffbf740 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674740 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0780: TRB 00000000fffbf750 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674797 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0790: TRB 00000000fffc2530 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674857 rikka kernel: xhci_hcd 0000:77:00.0: ffffc07a0: TRB 00000000fffbf760 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674916 rikka kernel: xhci_hcd 0000:77:00.0: ffffc07b0: TRB 00000000fffbf770 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.674972 rikka kernel: xhci_hcd 0000:77:00.0: ffffc07c0: TRB 00000000fffc2540 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675027 rikka kernel: xhci_hcd 0000:77:00.0: ffffc07d0: TRB 00000000fffbf780 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675085 rikka kernel: xhci_hcd 0000:77:00.0: ffffc07e0: TRB 00000000fffbf790 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675142 rikka kernel: xhci_hcd 0000:77:00.0: ffffc07f0: TRB 00000000fffc2550 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675198 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0800: TRB 00000000fffbf7a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675255 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0810: TRB 00000000fffbf7b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675310 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0820: TRB 00000000fffc2560 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675370 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0830: TRB 00000000fffbf7c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675424 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0840: TRB 00000000fffbf7d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675480 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0850: TRB 00000000fffc2570 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675536 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0860: TRB 00000000fffbf7e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675594 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0870: TRB 00000000fffbf7f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675650 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0880: TRB 00000000fffc2580 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675706 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0890: TRB 00000000fffbf800 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675760 rikka kernel: xhci_hcd 0000:77:00.0: ffffc08a0: TRB 00000000fffbf810 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675817 rikka kernel: xhci_hcd 0000:77:00.0: ffffc08b0: TRB 00000000fffc2590 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675876 rikka kernel: xhci_hcd 0000:77:00.0: ffffc08c0: TRB 00000000fffbf820 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675932 rikka kernel: xhci_hcd 0000:77:00.0: ffffc08d0: TRB 00000000fffc25a0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.675988 rikka kernel: xhci_hcd 0000:77:00.0: ffffc08e0: TRB 00000000fffc25b0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676044 rikka kernel: xhci_hcd 0000:77:00.0: ffffc08f0: TRB 00000000fffbf830 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676098 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0900: TRB 00000000fffbf840 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676152 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0910: TRB 00000000fffc25c0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676209 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0920: TRB 00000000fffbf850 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676264 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0930: TRB 00000000fffbf860 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676320 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0940: TRB 00000000fffc25d0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676377 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0950: TRB 00000000fffbf870 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676434 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0960: TRB 00000000fffbf880 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676490 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0970: TRB 00000000fffc25e0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676546 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0980: TRB 00000000fffbf890 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676601 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0990: TRB 00000000fffbf8a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676657 rikka kernel: xhci_hcd 0000:77:00.0: ffffc09a0: TRB 00000000fffc25f0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676713 rikka kernel: xhci_hcd 0000:77:00.0: ffffc09b0: TRB 00000000fffbf8b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676772 rikka kernel: xhci_hcd 0000:77:00.0: ffffc09c0: TRB 00000000fffbf8c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676829 rikka kernel: xhci_hcd 0000:77:00.0: ffffc09d0: TRB 00000000fffc2600 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676886 rikka kernel: xhci_hcd 0000:77:00.0: ffffc09e0: TRB 00000000fffbf8d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676942 rikka kernel: xhci_hcd 0000:77:00.0: ffffc09f0: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.676997 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a00: TRB 00000000ffffe130 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.677053 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a10: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.677108 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a20: TRB 00000000ffffe140 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.677164 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a30: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.677224 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a40: TRB 00000000ffffe150 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.677280 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a50: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.677335 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a60: TRB 00000000ffffe160 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.677395 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a70: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.677453 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a80: TRB 00000000ffffe170 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.677511 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0a90: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.677566 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0aa0: TRB 00000000ffffe180 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.677621 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ab0: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.677678 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ac0: TRB 00000000ffffe190 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.677735 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ad0: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.677791 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ae0: TRB 00000000ffffe1a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.677846 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0af0: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.677902 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b00: TRB 00000000ffffe1b0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.677959 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b10: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.678014 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b20: TRB 00000000ffffe1c0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.678070 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b30: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.678131 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b40: TRB 00000000ffffe1d0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
 9月 08 19:39:14.678186 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b50: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
 9月 08 19:39:14.678243 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b60: TRB 00000000fffc04d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678300 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b70: TRB 00000000fffc1b70 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678354 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b80: TRB 00000000fffc04e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678411 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0b90: TRB 00000000fffc04f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678470 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ba0: TRB 00000000fffc1b80 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678527 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0bb0: TRB 00000000fffc0500 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678581 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0bc0: TRB 00000000fffc0510 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678640 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0bd0: TRB 00000000fffc1b90 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678697 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0be0: TRB 00000000fffc0520 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678753 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0bf0: TRB 00000000fffc0530 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678810 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c00: TRB 00000000fffc1ba0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678867 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c10: TRB 00000000fffc0540 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678923 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c20: TRB 00000000fffc0550 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.678981 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c30: TRB 00000000fffc1bb0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679036 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c40: TRB 00000000fffc0560 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679094 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c50: TRB 00000000fffc0570 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679149 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c60: TRB 00000000fffc1bc0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679204 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c70: TRB 00000000fffc0580 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679261 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c80: TRB 00000000fffc0590 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679317 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0c90: TRB 00000000fffc1bd0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679374 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ca0: TRB 00000000fffc05a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679430 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0cb0: TRB 00000000fffc05b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679484 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0cc0: TRB 00000000fffc1be0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679541 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0cd0: TRB 00000000fffc05c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679596 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ce0: TRB 00000000fffc05d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679652 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0cf0: TRB 00000000fffc1bf0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679710 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d00: TRB 00000000fffc05e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679765 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d10: TRB 00000000fffc05f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679821 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d20: TRB 00000000fffc1c00 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679878 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d30: TRB 00000000fffc0600 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679934 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d40: TRB 00000000fffc0610 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.679990 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d50: TRB 00000000fffc1c10 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680048 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d60: TRB 00000000fffc0620 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680103 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d70: TRB 00000000fffc0630 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680162 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d80: TRB 00000000fffc1c20 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680218 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0d90: TRB 00000000fffc0640 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680275 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0da0: TRB 00000000fffc0650 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680331 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0db0: TRB 00000000fffc1c30 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680386 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0dc0: TRB 00000000fffc0660 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680441 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0dd0: TRB 00000000fffc0670 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680497 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0de0: TRB 00000000fffc1c40 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680553 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0df0: TRB 00000000fffc0680 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680609 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e00: TRB 00000000fffc0690 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680666 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e10: TRB 00000000fffc1c50 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680726 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e20: TRB 00000000fffc06a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680783 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e30: TRB 00000000fffc06b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680841 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e40: TRB 00000000fffc1c60 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680896 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e50: TRB 00000000fffc06c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.680952 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e60: TRB 00000000fffc06d0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681008 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e70: TRB 00000000fffc1c70 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681067 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e80: TRB 00000000fffc06e0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681123 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0e90: TRB 00000000fffc06f0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681178 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ea0: TRB 00000000fffc1c80 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681234 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0eb0: TRB 00000000fffc0700 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681288 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ec0: TRB 00000000fffc0710 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681346 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ed0: TRB 00000000fffc1c90 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681403 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ee0: TRB 00000000fffc0720 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681461 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ef0: TRB 00000000fffc0730 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681515 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f00: TRB 00000000fffc1ca0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681571 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f10: TRB 00000000fffc0740 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681626 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f20: TRB 00000000fffc0750 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681682 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f30: TRB 00000000fffc1cb0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681737 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f40: TRB 00000000fffc0760 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681792 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f50: TRB 00000000fffc0770 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681851 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f60: TRB 00000000fffc1cc0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681909 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f70: TRB 00000000fffc0780 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.681964 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f80: TRB 00000000fffc0790 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.682019 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0f90: TRB 00000000fffc1cd0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.682075 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0fa0: TRB 00000000fffc07a0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.682133 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0fb0: TRB 00000000fffc07b0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.682188 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0fc0: TRB 00000000fffc1ce0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.682245 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0fd0: TRB 00000000fffc07c0 status 'Success' len 0 slot 1 ep 4 type 'Transfer Event' flags e:C
 9月 08 19:39:14.682300 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0fe0: TRB 00000000fffc1cf0 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.682357 rikka kernel: xhci_hcd 0000:77:00.0: ffffc0ff0: TRB 00000000fffc1d00 status 'Success' len 0 slot 1 ep 3 type 'Transfer Event' flags e:C
 9月 08 19:39:14.682412 rikka kernel: xhci_hcd 0000:77:00.0: endpoint ring:
 9月 08 19:39:14.682468 rikka kernel: xhci_hcd 0000:77:00.0: fffc00000: Buffer 00000000ff7c8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.682526 rikka kernel: xhci_hcd 0000:77:00.0: fffc00010: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.682584 rikka kernel: xhci_hcd 0000:77:00.0: fffc00020: Buffer 00000000ff7d0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.682639 rikka kernel: xhci_hcd 0000:77:00.0: fffc00030: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.682696 rikka kernel: xhci_hcd 0000:77:00.0: fffc00040: Buffer 00000000ff7d8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.682753 rikka kernel: xhci_hcd 0000:77:00.0: fffc00050: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.682810 rikka kernel: xhci_hcd 0000:77:00.0: fffc00060: Buffer 00000000ff7e0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.682865 rikka kernel: xhci_hcd 0000:77:00.0: fffc00070: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.682922 rikka kernel: xhci_hcd 0000:77:00.0: fffc00080: Buffer 00000000ff7e8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.682980 rikka kernel: xhci_hcd 0000:77:00.0: fffc00090: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683036 rikka kernel: xhci_hcd 0000:77:00.0: fffc000a0: Buffer 00000000ff7f0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683092 rikka kernel: xhci_hcd 0000:77:00.0: fffc000b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683150 rikka kernel: xhci_hcd 0000:77:00.0: fffc000c0: Buffer 00000000ff7f8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683210 rikka kernel: xhci_hcd 0000:77:00.0: fffc000d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683267 rikka kernel: xhci_hcd 0000:77:00.0: fffc000e0: Buffer 00000000ff808000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683323 rikka kernel: xhci_hcd 0000:77:00.0: fffc000f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683379 rikka kernel: xhci_hcd 0000:77:00.0: fffc00100: Buffer 00000000ff810000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683437 rikka kernel: xhci_hcd 0000:77:00.0: fffc00110: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683492 rikka kernel: xhci_hcd 0000:77:00.0: fffc00120: Buffer 00000000ff818000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683549 rikka kernel: xhci_hcd 0000:77:00.0: fffc00130: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683604 rikka kernel: xhci_hcd 0000:77:00.0: fffc00140: Buffer 00000000ff820000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683659 rikka kernel: xhci_hcd 0000:77:00.0: fffc00150: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683715 rikka kernel: xhci_hcd 0000:77:00.0: fffc00160: Buffer 00000000ff828000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683770 rikka kernel: xhci_hcd 0000:77:00.0: fffc00170: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683825 rikka kernel: xhci_hcd 0000:77:00.0: fffc00180: Buffer 00000000ff830000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683881 rikka kernel: xhci_hcd 0000:77:00.0: fffc00190: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683937 rikka kernel: xhci_hcd 0000:77:00.0: fffc001a0: Buffer 00000000ff838000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.683994 rikka kernel: xhci_hcd 0000:77:00.0: fffc001b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684056 rikka kernel: xhci_hcd 0000:77:00.0: fffc001c0: Buffer 00000000ff840000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684111 rikka kernel: xhci_hcd 0000:77:00.0: fffc001d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684167 rikka kernel: xhci_hcd 0000:77:00.0: fffc001e0: Buffer 00000000ff848000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684224 rikka kernel: xhci_hcd 0000:77:00.0: fffc001f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684282 rikka kernel: xhci_hcd 0000:77:00.0: fffc00200: Buffer 00000000ff850000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684339 rikka kernel: xhci_hcd 0000:77:00.0: fffc00210: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684394 rikka kernel: xhci_hcd 0000:77:00.0: fffc00220: Buffer 00000000ff858000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684449 rikka kernel: xhci_hcd 0000:77:00.0: fffc00230: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684505 rikka kernel: xhci_hcd 0000:77:00.0: fffc00240: Buffer 00000000ff868000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684564 rikka kernel: xhci_hcd 0000:77:00.0: fffc00250: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684619 rikka kernel: xhci_hcd 0000:77:00.0: fffc00260: Buffer 00000000ff870000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684674 rikka kernel: xhci_hcd 0000:77:00.0: fffc00270: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684730 rikka kernel: xhci_hcd 0000:77:00.0: fffc00280: Buffer 00000000ff878000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684787 rikka kernel: xhci_hcd 0000:77:00.0: fffc00290: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684844 rikka kernel: xhci_hcd 0000:77:00.0: fffc002a0: Buffer 00000000ff880000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684901 rikka kernel: xhci_hcd 0000:77:00.0: fffc002b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.684958 rikka kernel: xhci_hcd 0000:77:00.0: fffc002c0: Buffer 00000000ff888000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685015 rikka kernel: xhci_hcd 0000:77:00.0: fffc002d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685073 rikka kernel: xhci_hcd 0000:77:00.0: fffc002e0: Buffer 00000000ff890000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685131 rikka kernel: xhci_hcd 0000:77:00.0: fffc002f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685187 rikka kernel: xhci_hcd 0000:77:00.0: fffc00300: Buffer 00000000ff898000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685243 rikka kernel: xhci_hcd 0000:77:00.0: fffc00310: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685299 rikka kernel: xhci_hcd 0000:77:00.0: fffc00320: Buffer 00000000ff8a0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685354 rikka kernel: xhci_hcd 0000:77:00.0: fffc00330: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685410 rikka kernel: xhci_hcd 0000:77:00.0: fffc00340: Buffer 00000000ff8a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685466 rikka kernel: xhci_hcd 0000:77:00.0: fffc00350: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685522 rikka kernel: xhci_hcd 0000:77:00.0: fffc00360: Buffer 00000000ff8b0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685577 rikka kernel: xhci_hcd 0000:77:00.0: fffc00370: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685634 rikka kernel: xhci_hcd 0000:77:00.0: fffc00380: Buffer 00000000ff8b8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685689 rikka kernel: xhci_hcd 0000:77:00.0: fffc00390: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685745 rikka kernel: xhci_hcd 0000:77:00.0: fffc003a0: Buffer 00000000ff8c0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685799 rikka kernel: xhci_hcd 0000:77:00.0: fffc003b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685857 rikka kernel: xhci_hcd 0000:77:00.0: fffc003c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685915 rikka kernel: xhci_hcd 0000:77:00.0: fffc003d0: Buffer 00000000ff8c8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.685972 rikka kernel: xhci_hcd 0000:77:00.0: fffc003e0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686029 rikka kernel: xhci_hcd 0000:77:00.0: fffc003f0: Buffer 00000000ff8d0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686086 rikka kernel: xhci_hcd 0000:77:00.0: fffc00400: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686142 rikka kernel: xhci_hcd 0000:77:00.0: fffc00410: Buffer 00000000ff8e0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686198 rikka kernel: xhci_hcd 0000:77:00.0: fffc00420: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686254 rikka kernel: xhci_hcd 0000:77:00.0: fffc00430: Buffer 00000000ff8e8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686310 rikka kernel: xhci_hcd 0000:77:00.0: fffc00440: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686366 rikka kernel: xhci_hcd 0000:77:00.0: fffc00450: Buffer 00000000ff8f0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686421 rikka kernel: xhci_hcd 0000:77:00.0: fffc00460: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686477 rikka kernel: xhci_hcd 0000:77:00.0: fffc00470: Buffer 00000000ff8f8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686533 rikka kernel: xhci_hcd 0000:77:00.0: fffc00480: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686589 rikka kernel: xhci_hcd 0000:77:00.0: fffc00490: Buffer 00000000ff900000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686643 rikka kernel: xhci_hcd 0000:77:00.0: fffc004a0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686699 rikka kernel: xhci_hcd 0000:77:00.0: fffc004b0: Buffer 00000000ff908000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686757 rikka kernel: xhci_hcd 0000:77:00.0: fffc004c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686814 rikka kernel: xhci_hcd 0000:77:00.0: fffc004d0: Buffer 00000000ff910000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686869 rikka kernel: xhci_hcd 0000:77:00.0: fffc004e0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686925 rikka kernel: xhci_hcd 0000:77:00.0: fffc004f0: Buffer 00000000ff918000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.686982 rikka kernel: xhci_hcd 0000:77:00.0: fffc00500: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687036 rikka kernel: xhci_hcd 0000:77:00.0: fffc00510: Buffer 00000000ff920000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687092 rikka kernel: xhci_hcd 0000:77:00.0: fffc00520: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687146 rikka kernel: xhci_hcd 0000:77:00.0: fffc00530: Buffer 00000000ff928000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687202 rikka kernel: xhci_hcd 0000:77:00.0: fffc00540: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687257 rikka kernel: xhci_hcd 0000:77:00.0: fffc00550: Buffer 00000000ff930000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687313 rikka kernel: xhci_hcd 0000:77:00.0: fffc00560: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687369 rikka kernel: xhci_hcd 0000:77:00.0: fffc00570: Buffer 00000000ff938000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687431 rikka kernel: xhci_hcd 0000:77:00.0: fffc00580: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687487 rikka kernel: xhci_hcd 0000:77:00.0: fffc00590: Buffer 00000000ff940000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687542 rikka kernel: xhci_hcd 0000:77:00.0: fffc005a0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687598 rikka kernel: xhci_hcd 0000:77:00.0: fffc005b0: Buffer 00000000ff948000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687653 rikka kernel: xhci_hcd 0000:77:00.0: fffc005c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687708 rikka kernel: xhci_hcd 0000:77:00.0: fffc005d0: Buffer 00000000ff950000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687763 rikka kernel: xhci_hcd 0000:77:00.0: fffc005e0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687820 rikka kernel: xhci_hcd 0000:77:00.0: fffc005f0: Buffer 00000000ff958000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687875 rikka kernel: xhci_hcd 0000:77:00.0: fffc00600: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687930 rikka kernel: xhci_hcd 0000:77:00.0: fffc00610: Buffer 00000000ff960000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.687985 rikka kernel: xhci_hcd 0000:77:00.0: fffc00620: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688042 rikka kernel: xhci_hcd 0000:77:00.0: fffc00630: Buffer 00000000ff968000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688097 rikka kernel: xhci_hcd 0000:77:00.0: fffc00640: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688151 rikka kernel: xhci_hcd 0000:77:00.0: fffc00650: Buffer 00000000ff970000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688207 rikka kernel: xhci_hcd 0000:77:00.0: fffc00660: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688261 rikka kernel: xhci_hcd 0000:77:00.0: fffc00670: Buffer 00000000ff978000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688316 rikka kernel: xhci_hcd 0000:77:00.0: fffc00680: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688372 rikka kernel: xhci_hcd 0000:77:00.0: fffc00690: Buffer 00000000ff980000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688429 rikka kernel: xhci_hcd 0000:77:00.0: fffc006a0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688483 rikka kernel: xhci_hcd 0000:77:00.0: fffc006b0: Buffer 00000000ff928000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688538 rikka kernel: xhci_hcd 0000:77:00.0: fffc006c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688593 rikka kernel: xhci_hcd 0000:77:00.0: fffc006d0: Buffer 00000000ff920000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688651 rikka kernel: xhci_hcd 0000:77:00.0: fffc006e0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688706 rikka kernel: xhci_hcd 0000:77:00.0: fffc006f0: Buffer 00000000ff918000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688761 rikka kernel: xhci_hcd 0000:77:00.0: fffc00700: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688816 rikka kernel: xhci_hcd 0000:77:00.0: fffc00710: Buffer 00000000ff910000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688871 rikka kernel: xhci_hcd 0000:77:00.0: fffc00720: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688926 rikka kernel: xhci_hcd 0000:77:00.0: fffc00730: Buffer 00000000ff908000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.688982 rikka kernel: xhci_hcd 0000:77:00.0: fffc00740: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689037 rikka kernel: xhci_hcd 0000:77:00.0: fffc00750: Buffer 00000000ff900000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689094 rikka kernel: xhci_hcd 0000:77:00.0: fffc00760: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689150 rikka kernel: xhci_hcd 0000:77:00.0: fffc00770: Buffer 00000000ff8f8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689205 rikka kernel: xhci_hcd 0000:77:00.0: fffc00780: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689259 rikka kernel: xhci_hcd 0000:77:00.0: fffc00790: Buffer 00000000ff8f0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689315 rikka kernel: xhci_hcd 0000:77:00.0: fffc007a0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689370 rikka kernel: xhci_hcd 0000:77:00.0: fffc007b0: Buffer 00000000ff8e8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689425 rikka kernel: xhci_hcd 0000:77:00.0: fffc007c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689480 rikka kernel: xhci_hcd 0000:77:00.0: fffc007d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689536 rikka kernel: xhci_hcd 0000:77:00.0: fffc007e0: Buffer 00000000ff8e0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689591 rikka kernel: xhci_hcd 0000:77:00.0: fffc007f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689646 rikka kernel: xhci_hcd 0000:77:00.0: fffc00800: Buffer 00000000ff8d0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689701 rikka kernel: xhci_hcd 0000:77:00.0: fffc00810: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689755 rikka kernel: xhci_hcd 0000:77:00.0: fffc00820: Buffer 00000000ff8c8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689810 rikka kernel: xhci_hcd 0000:77:00.0: fffc00830: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689866 rikka kernel: xhci_hcd 0000:77:00.0: fffc00840: Buffer 00000000ff8c0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689922 rikka kernel: xhci_hcd 0000:77:00.0: fffc00850: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.689978 rikka kernel: xhci_hcd 0000:77:00.0: fffc00860: Buffer 00000000ff8b8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690034 rikka kernel: xhci_hcd 0000:77:00.0: fffc00870: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690088 rikka kernel: xhci_hcd 0000:77:00.0: fffc00880: Buffer 00000000ff8b0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690144 rikka kernel: xhci_hcd 0000:77:00.0: fffc00890: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690199 rikka kernel: xhci_hcd 0000:77:00.0: fffc008a0: Buffer 00000000ff8a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690254 rikka kernel: xhci_hcd 0000:77:00.0: fffc008b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690310 rikka kernel: xhci_hcd 0000:77:00.0: fffc008c0: Buffer 00000000ff8a0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690364 rikka kernel: xhci_hcd 0000:77:00.0: fffc008d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690423 rikka kernel: xhci_hcd 0000:77:00.0: fffc008e0: Buffer 00000000ff898000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690478 rikka kernel: xhci_hcd 0000:77:00.0: fffc008f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690533 rikka kernel: xhci_hcd 0000:77:00.0: fffc00900: Buffer 00000000ff890000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690590 rikka kernel: xhci_hcd 0000:77:00.0: fffc00910: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690645 rikka kernel: xhci_hcd 0000:77:00.0: fffc00920: Buffer 00000000ff888000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690700 rikka kernel: xhci_hcd 0000:77:00.0: fffc00930: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690758 rikka kernel: xhci_hcd 0000:77:00.0: fffc00940: Buffer 00000000ff880000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690813 rikka kernel: xhci_hcd 0000:77:00.0: fffc00950: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690869 rikka kernel: xhci_hcd 0000:77:00.0: fffc00960: Buffer 00000000ff878000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690926 rikka kernel: xhci_hcd 0000:77:00.0: fffc00970: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.690981 rikka kernel: xhci_hcd 0000:77:00.0: fffc00980: Buffer 00000000ff870000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691038 rikka kernel: xhci_hcd 0000:77:00.0: fffc00990: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691095 rikka kernel: xhci_hcd 0000:77:00.0: fffc009a0: Buffer 00000000ff868000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691150 rikka kernel: xhci_hcd 0000:77:00.0: fffc009b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691205 rikka kernel: xhci_hcd 0000:77:00.0: fffc009c0: Buffer 00000000ff858000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691260 rikka kernel: xhci_hcd 0000:77:00.0: fffc009d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691318 rikka kernel: xhci_hcd 0000:77:00.0: fffc009e0: Buffer 00000000ff850000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691374 rikka kernel: xhci_hcd 0000:77:00.0: fffc009f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691429 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a00: Buffer 00000000ff848000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691486 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a10: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691544 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a20: Buffer 00000000ff840000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691599 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a30: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691656 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a40: Buffer 00000000ff838000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691712 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a50: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691769 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a60: Buffer 00000000ff830000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691825 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a70: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691880 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a80: Buffer 00000000ff828000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691936 rikka kernel: xhci_hcd 0000:77:00.0: fffc00a90: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.691994 rikka kernel: xhci_hcd 0000:77:00.0: fffc00aa0: Buffer 00000000ff820000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692049 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ab0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692107 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ac0: Buffer 00000000ff818000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692161 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ad0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692220 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ae0: Buffer 00000000ff810000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692278 rikka kernel: xhci_hcd 0000:77:00.0: fffc00af0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692334 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b00: Buffer 00000000ff808000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692391 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b10: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692449 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b20: Buffer 00000000ff7f8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692504 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b30: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692559 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b40: Buffer 00000000ff7f0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692614 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b50: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692670 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b60: Buffer 00000000ff7e8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692725 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b70: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692784 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b80: Buffer 00000000ff7e0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692839 rikka kernel: xhci_hcd 0000:77:00.0: fffc00b90: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692900 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ba0: Buffer 00000000ff7d8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.692957 rikka kernel: xhci_hcd 0000:77:00.0: fffc00bb0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693013 rikka kernel: xhci_hcd 0000:77:00.0: fffc00bc0: Buffer 00000000ff7d0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693069 rikka kernel: xhci_hcd 0000:77:00.0: fffc00bd0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693124 rikka kernel: xhci_hcd 0000:77:00.0: fffc00be0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693179 rikka kernel: xhci_hcd 0000:77:00.0: fffc00bf0: Buffer 00000000ff7c8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693235 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c00: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693290 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c10: Buffer 00000000ff7c0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693345 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c20: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693400 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c30: Buffer 00000000ff7b8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693456 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c40: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693513 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c50: Buffer 00000000ff7b0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693570 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c60: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693626 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c70: Buffer 00000000ff7a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693681 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c80: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693736 rikka kernel: xhci_hcd 0000:77:00.0: fffc00c90: Buffer 00000000ff7a0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693792 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ca0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693847 rikka kernel: xhci_hcd 0000:77:00.0: fffc00cb0: Buffer 00000000ff798000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693901 rikka kernel: xhci_hcd 0000:77:00.0: fffc00cc0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.693956 rikka kernel: xhci_hcd 0000:77:00.0: fffc00cd0: Buffer 00000000ff790000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694013 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ce0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694070 rikka kernel: xhci_hcd 0000:77:00.0: fffc00cf0: Buffer 00000000ff788000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694128 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d00: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694183 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d10: Buffer 00000000ff780000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694240 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d20: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694295 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d30: Buffer 00000000ff778000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694352 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d40: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694411 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d50: Buffer 00000000ff770000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694466 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d60: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694522 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d70: Buffer 00000000ff768000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694577 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d80: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694632 rikka kernel: xhci_hcd 0000:77:00.0: fffc00d90: Buffer 00000000ff758000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694688 rikka kernel: xhci_hcd 0000:77:00.0: fffc00da0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694743 rikka kernel: xhci_hcd 0000:77:00.0: fffc00db0: Buffer 00000000ff750000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694800 rikka kernel: xhci_hcd 0000:77:00.0: fffc00dc0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694858 rikka kernel: xhci_hcd 0000:77:00.0: fffc00dd0: Buffer 00000000ff748000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694916 rikka kernel: xhci_hcd 0000:77:00.0: fffc00de0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.694971 rikka kernel: xhci_hcd 0000:77:00.0: fffc00df0: Buffer 00000000ff740000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695026 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e00: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695081 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e10: Buffer 00000000ff738000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695137 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e20: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695192 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e30: Buffer 00000000ff730000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695249 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e40: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695304 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e50: Buffer 00000000ff728000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695360 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e60: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695414 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e70: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695470 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e80: Buffer 00000000ff720000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695524 rikka kernel: xhci_hcd 0000:77:00.0: fffc00e90: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695579 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ea0: Buffer 00000000ff718000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695636 rikka kernel: xhci_hcd 0000:77:00.0: fffc00eb0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695692 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ec0: Buffer 00000000ff710000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695750 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ed0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695805 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ee0: Buffer 00000000ff708000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695859 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ef0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695914 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f00: Buffer 00000000ff700000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.695970 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f10: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696025 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f20: Buffer 00000000ff6f8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696083 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f30: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696138 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f40: Buffer 00000000ff290000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696196 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f50: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696253 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f60: Buffer 00000000ff298000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696308 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f70: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696363 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f80: Buffer 00000000ff2a0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696418 rikka kernel: xhci_hcd 0000:77:00.0: fffc00f90: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696474 rikka kernel: xhci_hcd 0000:77:00.0: fffc00fa0: Buffer 00000000ff2a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696528 rikka kernel: xhci_hcd 0000:77:00.0: fffc00fb0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696585 rikka kernel: xhci_hcd 0000:77:00.0: fffc00fc0: Buffer 00000000ff2b0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696642 rikka kernel: xhci_hcd 0000:77:00.0: fffc00fd0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696697 rikka kernel: xhci_hcd 0000:77:00.0: fffc00fe0: Buffer 00000000ff2b8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696753 rikka kernel: xhci_hcd 0000:77:00.0: fffc00ff0: LINK 00000000fffbf000 intr 0 type 'Link' flags i:c:t:C
 9月 08 19:39:14.696808 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0000: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696867 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0010: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696924 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0020: Buffer 00000000ff528000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.696979 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0030: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697034 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0040: Buffer 00000000ff530000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697090 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0050: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697147 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0060: Buffer 00000000ff538000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697202 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0070: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697257 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0080: Buffer 00000000ff540000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697312 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0090: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697369 rikka kernel: xhci_hcd 0000:77:00.0: fffbf00a0: Buffer 00000000ff6e8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697428 rikka kernel: xhci_hcd 0000:77:00.0: fffbf00b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697485 rikka kernel: xhci_hcd 0000:77:00.0: fffbf00c0: Buffer 00000000ff6e0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697540 rikka kernel: xhci_hcd 0000:77:00.0: fffbf00d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697597 rikka kernel: xhci_hcd 0000:77:00.0: fffbf00e0: Buffer 00000000ff6d8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697653 rikka kernel: xhci_hcd 0000:77:00.0: fffbf00f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697708 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0100: Buffer 00000000ff6d0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697763 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0110: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697817 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0120: Buffer 00000000ff6c8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697872 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0130: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697928 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0140: Buffer 00000000ff6c0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.697983 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0150: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698040 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0160: Buffer 00000000ff6b0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698094 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0170: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698151 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0180: Buffer 00000000ff6a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698207 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0190: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698262 rikka kernel: xhci_hcd 0000:77:00.0: fffbf01a0: Buffer 00000000ff6a0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698317 rikka kernel: xhci_hcd 0000:77:00.0: fffbf01b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698374 rikka kernel: xhci_hcd 0000:77:00.0: fffbf01c0: Buffer 00000000ff698000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698428 rikka kernel: xhci_hcd 0000:77:00.0: fffbf01d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698486 rikka kernel: xhci_hcd 0000:77:00.0: fffbf01e0: Buffer 00000000ff690000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698541 rikka kernel: xhci_hcd 0000:77:00.0: fffbf01f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698596 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0200: Buffer 00000000ff688000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698650 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0210: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698706 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0220: Buffer 00000000ff680000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698763 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0230: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698820 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0240: Buffer 00000000ff678000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698875 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0250: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698932 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0260: Buffer 00000000ff670000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.698987 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0270: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699044 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0280: Buffer 00000000ff668000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699100 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0290: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699156 rikka kernel: xhci_hcd 0000:77:00.0: fffbf02a0: Buffer 00000000ff660000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699212 rikka kernel: xhci_hcd 0000:77:00.0: fffbf02b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699270 rikka kernel: xhci_hcd 0000:77:00.0: fffbf02c0: Buffer 00000000ff658000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699324 rikka kernel: xhci_hcd 0000:77:00.0: fffbf02d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699379 rikka kernel: xhci_hcd 0000:77:00.0: fffbf02e0: Buffer 00000000ff650000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699434 rikka kernel: xhci_hcd 0000:77:00.0: fffbf02f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699491 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0300: Buffer 00000000ff648000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699545 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0310: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699602 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0320: Buffer 00000000ff640000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699656 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0330: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699712 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0340: Buffer 00000000ff638000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699767 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0350: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699824 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0360: Buffer 00000000ff630000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699881 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0370: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699936 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0380: Buffer 00000000ff628000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.699995 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0390: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700051 rikka kernel: xhci_hcd 0000:77:00.0: fffbf03a0: Buffer 00000000ff620000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700107 rikka kernel: xhci_hcd 0000:77:00.0: fffbf03b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700166 rikka kernel: xhci_hcd 0000:77:00.0: fffbf03c0: Buffer 00000000ff618000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700221 rikka kernel: xhci_hcd 0000:77:00.0: fffbf03d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700279 rikka kernel: xhci_hcd 0000:77:00.0: fffbf03e0: Buffer 00000000ff610000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700338 rikka kernel: xhci_hcd 0000:77:00.0: fffbf03f0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700394 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0400: Buffer 00000000ff608000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700451 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0410: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700506 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0420: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700562 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0430: Buffer 00000000ff600000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700619 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0440: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700673 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0450: Buffer 00000000ff5f8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700735 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0460: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700790 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0470: Buffer 00000000ff5f0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700846 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0480: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700901 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0490: Buffer 00000000ff5e8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.700958 rikka kernel: xhci_hcd 0000:77:00.0: fffbf04a0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701012 rikka kernel: xhci_hcd 0000:77:00.0: fffbf04b0: Buffer 00000000ff5e0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701069 rikka kernel: xhci_hcd 0000:77:00.0: fffbf04c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701127 rikka kernel: xhci_hcd 0000:77:00.0: fffbf04d0: Buffer 00000000ff5d8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701183 rikka kernel: xhci_hcd 0000:77:00.0: fffbf04e0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701238 rikka kernel: xhci_hcd 0000:77:00.0: fffbf04f0: Buffer 00000000ff5d0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701294 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0500: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701350 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0510: Buffer 00000000ff5c8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701405 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0520: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701460 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0530: Buffer 00000000ff5c0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701517 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0540: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701572 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0550: Buffer 00000000ff5b8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701630 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0560: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701685 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0570: Buffer 00000000ff5a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701742 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0580: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701797 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0590: Buffer 00000000ff5a0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701852 rikka kernel: xhci_hcd 0000:77:00.0: fffbf05a0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701907 rikka kernel: xhci_hcd 0000:77:00.0: fffbf05b0: Buffer 00000000ff598000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.701964 rikka kernel: xhci_hcd 0000:77:00.0: fffbf05c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702021 rikka kernel: xhci_hcd 0000:77:00.0: fffbf05d0: Buffer 00000000ff590000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702077 rikka kernel: xhci_hcd 0000:77:00.0: fffbf05e0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702131 rikka kernel: xhci_hcd 0000:77:00.0: fffbf05f0: Buffer 00000000ff588000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702186 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0600: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702243 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0610: Buffer 00000000ff580000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702298 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0620: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702354 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0630: Buffer 00000000ff578000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702409 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0640: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702464 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0650: Buffer 00000000ff570000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702519 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0660: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702574 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0670: Buffer 00000000ff568000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702629 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0680: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702684 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0690: Buffer 00000000ff560000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702742 rikka kernel: xhci_hcd 0000:77:00.0: fffbf06a0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702797 rikka kernel: xhci_hcd 0000:77:00.0: fffbf06b0: Buffer 00000000ff558000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702852 rikka kernel: xhci_hcd 0000:77:00.0: fffbf06c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702907 rikka kernel: xhci_hcd 0000:77:00.0: fffbf06d0: Buffer 00000000ff550000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.702964 rikka kernel: xhci_hcd 0000:77:00.0: fffbf06e0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703021 rikka kernel: xhci_hcd 0000:77:00.0: fffbf06f0: Buffer 00000000ff5a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703075 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0700: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703132 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0710: Buffer 00000000ff5b8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703187 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0720: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703244 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0730: Buffer 00000000ff5c0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703300 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0740: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703356 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0750: Buffer 00000000ff5c8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703411 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0760: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703465 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0770: Buffer 00000000ff5d0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703521 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0780: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703576 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0790: Buffer 00000000ff5d8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703632 rikka kernel: xhci_hcd 0000:77:00.0: fffbf07a0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703688 rikka kernel: xhci_hcd 0000:77:00.0: fffbf07b0: Buffer 00000000ff5e0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703743 rikka kernel: xhci_hcd 0000:77:00.0: fffbf07c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703798 rikka kernel: xhci_hcd 0000:77:00.0: fffbf07d0: Buffer 00000000ff5e8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703853 rikka kernel: xhci_hcd 0000:77:00.0: fffbf07e0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703909 rikka kernel: xhci_hcd 0000:77:00.0: fffbf07f0: Buffer 00000000ff5f0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.703966 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0800: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704022 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0810: Buffer 00000000ff5f8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704079 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0820: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704138 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0830: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704193 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0840: Buffer 00000000ff600000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704248 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0850: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704303 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0860: Buffer 00000000ff608000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704359 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0870: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704415 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0880: Buffer 00000000ff610000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704469 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0890: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704524 rikka kernel: xhci_hcd 0000:77:00.0: fffbf08a0: Buffer 00000000ff618000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704581 rikka kernel: xhci_hcd 0000:77:00.0: fffbf08b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704637 rikka kernel: xhci_hcd 0000:77:00.0: fffbf08c0: Buffer 00000000ff620000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704694 rikka kernel: xhci_hcd 0000:77:00.0: fffbf08d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704748 rikka kernel: xhci_hcd 0000:77:00.0: fffbf08e0: Buffer 00000000ff628000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
 9月 08 19:39:14.704804 rikka kernel: xhci_hcd 0000:77:00.0: fffbf08f0: Buffer 00000000ff670000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.704859 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0900: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.704915 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0910: Buffer 00000000ff670000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.704971 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0920: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705028 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0930: Buffer 00000000ff670000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705083 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0940: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705138 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0950: Buffer 00000000ff670000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705194 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0960: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705249 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0970: Buffer 00000000ff670000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705304 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0980: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705359 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0990: Buffer 00000000ff670000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705414 rikka kernel: xhci_hcd 0000:77:00.0: fffbf09a0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705472 rikka kernel: xhci_hcd 0000:77:00.0: fffbf09b0: Buffer 00000000ff678000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705527 rikka kernel: xhci_hcd 0000:77:00.0: fffbf09c0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705583 rikka kernel: xhci_hcd 0000:77:00.0: fffbf09d0: Buffer 00000000ff680000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705638 rikka kernel: xhci_hcd 0000:77:00.0: fffbf09e0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705697 rikka kernel: xhci_hcd 0000:77:00.0: fffbf09f0: Buffer 00000000ff688000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705752 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a00: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705809 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a10: Buffer 00000000ff690000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705865 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a20: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705922 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a30: Buffer 00000000ff698000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.705979 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a40: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706033 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a50: Buffer 00000000ff6a0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706090 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a60: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706145 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a70: Buffer 00000000ff6a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706200 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a80: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706256 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0a90: Buffer 00000000ff6b0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706312 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0aa0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706369 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ab0: Buffer 00000000ff6c0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706424 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ac0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706480 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ad0: Buffer 00000000ff6c8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706536 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ae0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706591 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0af0: Buffer 00000000ff6d0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706646 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b00: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706702 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b10: Buffer 00000000ff6d8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706760 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b20: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706815 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b30: Buffer 00000000ff6e0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706871 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b40: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706926 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b50: Buffer 00000000ff6e8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.706982 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b60: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707036 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b70: Buffer 00000000ff540000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707091 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b80: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707146 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0b90: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707203 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ba0: Buffer 00000000ff538000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707258 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0bb0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707313 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0bc0: Buffer 00000000ff530000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707370 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0bd0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707425 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0be0: Buffer 00000000ff528000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707479 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0bf0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707534 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c00: Buffer 00000000ff2b8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707590 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c10: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707646 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c20: Buffer 00000000ff2b0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707701 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c30: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707758 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c40: Buffer 00000000ff2a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707814 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c50: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707870 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c60: Buffer 00000000ff2a0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707926 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c70: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.707980 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c80: Buffer 00000000ff298000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708035 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0c90: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708092 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ca0: Buffer 00000000ff290000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708148 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0cb0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708205 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0cc0: Buffer 00000000ff6f8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708261 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0cd0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708317 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ce0: Buffer 00000000ff700000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708374 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0cf0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708429 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d00: Buffer 00000000ff708000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708484 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d10: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708541 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d20: Buffer 00000000ff710000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708595 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d30: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708650 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d40: Buffer 00000000ff718000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708705 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d50: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708760 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d60: Buffer 00000000ff720000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708816 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d70: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708870 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d80: Buffer 00000000ff728000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708924 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0d90: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.708983 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0da0: Buffer 00000000ff730000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709038 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0db0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709093 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0dc0: Buffer 00000000ff738000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709148 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0dd0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709204 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0de0: Buffer 00000000ff740000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709260 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0df0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709315 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e00: Buffer 00000000ff748000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709371 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e10: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709426 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e20: Buffer 00000000ff750000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709482 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e30: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709538 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e40: Buffer 00000000ff758000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709595 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e50: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709651 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e60: Buffer 00000000ff768000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709708 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e70: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709763 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e80: Buffer 00000000ff770000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709821 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0e90: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709876 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ea0: Buffer 00000000ff778000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709931 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0eb0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.709987 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ec0: Buffer 00000000ff780000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710041 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ed0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710096 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ee0: Buffer 00000000ff788000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710151 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ef0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710208 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f00: Buffer 00000000ff790000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710266 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f10: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710322 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f20: Buffer 00000000ff798000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710378 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f30: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710434 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f40: Buffer 00000000ff7a0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710489 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f50: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710545 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f60: Buffer 00000000ff7a8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710602 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f70: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710658 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f80: Buffer 00000000ff7b0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710716 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0f90: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710773 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0fa0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710828 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0fb0: Buffer 00000000ff7b8000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710885 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0fc0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710940 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0fd0: Buffer 00000000ff7c0000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.710997 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0fe0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
 9月 08 19:39:14.711053 rikka kernel: xhci_hcd 0000:77:00.0: fffbf0ff0: LINK 00000000fffc0000 intr 0 type 'Link' flags i:c:T:c
 9月 08 19:39:14.711109 rikka kernel: xhci_hcd 0000:77:00.0: Hard-reset ep 3, slot 1
 9月 08 19:39:14.770717 rikka kernel: usb 6-1: reset SuperSpeed USB device number 2 using xhci_hcd
 9月 08 19:39:14.785281 rikka kernel: xhci_hcd 0000:77:00.0: Stopped on No-op or Link TRB for slot 1 ep 2
 9月 08 19:39:16.084568 rikka kernel: xhci_hcd 0000:77:00.0: clear err_count at ffffd1404251b000

------------------------------------------------------------

Thanks,
wakasio
