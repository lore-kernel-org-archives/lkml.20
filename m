Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C90B3859D4
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025997; cv=none; b=sYoEkYGtGiQARCdu1/VgjZlu8Y/Q6DQ2S7mHfU9/PWilEL599tW+NFIii7hr7Q1xWL5eo10CGKlJnQs03mevIPIeIPtPHjQ3kqCc0qAdV3WB6DKqa+8NgX90wnKLR9nD6abM7OUWF3vreKjVoeZSTUfoNK9Ght3FBTiI1l2Xrbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025997; c=relaxed/simple;
	bh=AGDArOvVArVKUmPEAtnxyA3zzxKgJY7DNkkyhH3xZbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KgII0PmrEhzQuzZmD01J5EnL6fRVfP8Bqibn6BAp1mvcR6xBIxKxESKzeBd9zH9YjaNClM42rNZsFtn3L3l+CK87I3FOrOAi/xLGeC/GhfSbfbzk6NCqf7ojCsFFQUpQcuzluYjwqXX74xXPBqSnF9Xkei86nQdamhhobXYrAy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rivian.com; spf=pass smtp.mailfrom=rivian.com; dkim=pass (2048-bit key) header.d=rivian.com header.i=@rivian.com header.b=gh8M/YIc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rivian.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivian.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivian.com header.i=@rivian.com header.b="gh8M/YIc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d715f4a587so29031545ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivian.com; s=google; t=1788025996; x=1788630796; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBbzW+U1XX2evPmEKqq7snt9OxQ5avJUWLwD2vkYuH0=;
        b=gh8M/YIc9VflWEc5fLWTk7PkUdqifWbiRNaKc7Jrv/e/6wlgaGDoKtBtnWz3JppP0s
         TXXSv75FnyKFBwXT+He/Y04K1VXmBcReeC+4FpJEvu7ytjYDHy2Ef1qJR81Wmp6y4uM/
         FbpxXUmZxM+wYIHZfelQSB+8TLWUFfCWHX20AthuQKuW3k4T8L90Zutr87COZNgQ6qg6
         WAh5qmm1sXVr7INh7fbDsFjWaW/wUEPvXHGuGCTQj/yXcUyLH7M66Z37Ui68WzfbY9dY
         HX61TxG2OSEHqkpzmOrEbkUQZgwYbJqVbFJeHJ9X7LsApfVxhU4enrLCCMasXT6sZL4/
         YfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025996; x=1788630796;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBbzW+U1XX2evPmEKqq7snt9OxQ5avJUWLwD2vkYuH0=;
        b=sc/oI8TDWoeu7oxzd7+WBKvUw5Oq8pc2IQWAzH/0sEoiGv+N/4M23GU4Cqshp5IbeE
         wAXkEvQooDZ/Ae9n3aYfW02Os7mnl4gaVP1sVMOHLgpnLjJm79/KXV3EPzxOtm+OZTxF
         C7FdjXcdsQffwAWQsZFyKCa1hJaA4rmBiIq1Vtl+/Eh11c3sdYDWPbrm3Xl5odnla9GX
         NoKBioEjeYVCcEQhBgRWQsQNfu7GelyPZknKl36JNH9WzEKtzrJa+k0uVKeCZ7vnWWrR
         CB1q4cLNM75JFpqviTljDeaE81Aroo1QKpi8rqU45veZ6rXOSVKdNNF9juKtj6fopaL2
         5hEw==
X-Gm-Message-State: AFuF++mRxcWbPkvQJ8qMWM4RDlibDnlN/KQ4k95TwELdaFWUEkqOhZeM
	1TZrRpvuM00DyW0iO/I8KWmZp+lrA3v7JSOHme3V9ne5Na6E/auKjwTHitoJr2aMkKkNJLZOKfo
	3MNzxjng3gaaz27RJxXVb5MD/HHuEsQEeuh7c/sNNvetj581BoBi56Sq6nUQ=
X-Gm-Gg: AYBFou3cOHGRl+6a83dlBqszo2W3YrfuBSudne7Po5hXwqf9BZi9Dgm7At2Cf3GnMiG
	j3g1+kM7Uvtoms/o7fte06uwBrj5Pwr7TAAPCKIOa2f+w8LAyYrX2jybY45Y4csgdW/e18kSoyQ
	D661tRYSKpaMn7zYyYmjITGyqqUiGpMJ5pwm/qqcWWAPcRPSGNcLgMadayJR5y186sO+uX1XXZl
	eoNIZTiBYsVQmqwhanbhbuEfbOk/IVknd5EzAdlb95uCHvr/dPP7Onua8HwmKuSgsmqWsKI2okI
	eIxmwvmBkuNzeCgZHGv74nTq8bBORas6Amd6nlxuOzVY5IQLzrVZgWje6RRUbq2BM/Xy2yHWgGT
	ULD4r3+j9VAdTRMk5lgTVo+JJGlSPlInrCjsMW4siMBOiYG6t0nn5g2elsgKLSspYxMU73V6j1/
	Hkac0EDXlH7dz8DY2o4s7OfrhfLXSiGdGYQLuxLysiKby7r6QbIF+8Ki9roomKI0OEQICZy7NJF
	xj+HtvQt4yVNrxK4aldubk/5DM72XGisgQ3l33y1/qli7iYzTSW3RcRAwe99Hr4wr1c210I2gG4
	wARm2WhzjIrdUUwh
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr273366975ad.2.1788025995458;
        Sat, 29 Aug 2026 10:53:15 -0700 (PDT)
Received: from ip-10-198-159-19.us-west-2.compute.internal (ec2-44-232-128-107.us-west-2.compute.amazonaws.com. [44.232.128.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8fdf63db8sm2159795ad.27.2026.08.29.10.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:53:15 -0700 (PDT)
From: Roland Dreier <rolanddreier@rivian.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Couple of SCMI race fixes
Date: Sat, 29 Aug 2026 17:53:14 +0000
Message-ID: <20260829175314.4067393-1-rolanddreier@rivian.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
References: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

> Noticed a couple of races in SCMI code around delayed responses that
> time out. These are probably nearly impossible to hit in practice but
> the fixes are pretty straightforward and it seems worth having the
> code be sound.

Hi, just wondering if you had a chance to look at these patches, let me
know if there are any questions or fixes needed.

Thanks!
  Roland

                        |||
Ignore any footer below vvv

-- 
*CONFIDENTIALITY NOTE:* This electronic message (including any attachments) 
may contain information that is privileged, confidential, and proprietary. 
If you are not the intended recipient, you are hereby notified that any 
disclosure, copying, distribution, or use of the information contained 
herein (including any reliance thereon) is strictly prohibited. If you 
received this electronic message in error, please immediately reply to the 
sender that you have received this communication and destroy the material 
in its entirety, whether in electronic or hard copy format. Although Rivian 
has taken reasonable precautions to ensure no viruses are present in this 
email, Rivian accepts no responsibility for any loss or damage arising from 
the use of this email or attachments.
