Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02C23C368
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912218; cv=none; b=UfHdLCBCSp3F9tjeJ5ItgUrhFnamBg1iq0OSo37CQX9jIjhN8v5kG4DvbA1IwJRCRjfUvP5yxlvv8UNJjXXZqlsWUzmtTi3sSestioO66ML1eJU2t+lHIi9icBclrtdLVmcMiJNey02fUPHD7H2MZ/ALEODtATvyKcsJ/JQGyAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912218; c=relaxed/simple;
	bh=+eh/TA1mjdDBmA8oGDu5zjCAqUCaImhG6x3qT/T8CFs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GDuNX3NNh+mG38vx05eIkxsPC3d7Lwb1pPIXaq7FpOx1WOtTOwXnbb6MVka/+Exiz8AYKYG/kmxk9zDphYWj7qaHNeNAqMILKe2zGl2URuBDegg9M3eVS18MG5Hd/ngb3nWjdBgYOvEfJGh51+5zFoHf3URj3L85n8bEdL0rvW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEYeiwke; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEYeiwke"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc72777faa2so1333868a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789912216; x=1790517016; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eh/TA1mjdDBmA8oGDu5zjCAqUCaImhG6x3qT/T8CFs=;
        b=tEYeiwkeYfdc4k2djMjNnAuW5U1vsD8IaHWcVPbbQRusBIHtGJsBWccJlAu8pRbqXJ
         xAeWVP4/tLufERY+jIHe4aPI68ydU2LqJbyA1ZoSrtPb7KALTxACmxLEwQGE/FkgNkVR
         i9kEXWqZ9vIxJ3TvHWu+GmG/IDcUIt+7vICiC9l7ZFvdCSyFjOz9x3ZPImzp5S+jyLAE
         mpaVWxkVC9omLDpwR4MZSF3I3SnOUO/Ww19Rm34C3F+UIY038MSJZdi59KrsrqdJpZ0U
         Ejm8mmP23RxhVBJpn1k+4If/vM2teXMm6+COIkenBgMZnYcmeLOHLI1R6AFbzhaMcPEc
         n/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912216; x=1790517016;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+eh/TA1mjdDBmA8oGDu5zjCAqUCaImhG6x3qT/T8CFs=;
        b=xPqfmaZalb0UiS04MNOtAzfahx5gP96sBHzB2Lf8mBXZ6+gLlAPjBEce+GRgxNm6/v
         Dt39NwYAdG84hZVNE76+g2iZMnWG6C3uPXXQv/Q1UAw6ClaZyGMjQQmKRQPfGfQcJ66X
         z9pTZElhzDXJ/uHM6gZ74R+lSjcJdOEKFkUGGP75CCP9fi2SKEn/zb9tmCClXjc077Q5
         /EnCx7BHUJdhJ3LwBqTTSl4ZxGrJsYWwvo7LqEUsUX7CHHDkqpqq9WqbWGYZHbmoXf1/
         JSymdDFBeNUnJEW+2Gme+c+nZI+LY+TJ42s50zgEhCjwZ4soRvmlTKvG0xhdhcqKnrwB
         2DMA==
X-Forwarded-Encrypted: i=1; AKwUvBxDp2fqRthd4a8gLzgCvQx1+ogyE9txXrcUPQm1yxWfi8c6xzn8QDoqqMEravZftTBhgwKiNVsodqEiJ1g=@vger.kernel.org
X-Gm-Message-State: AFuF++lxmVOHZVGz8uYvDQz1Bm0tbrEzX0KLYWi5lQZXaEY4giMc0olN
	HTT6Wy02prnMHOaWA6y3XiJNo16Hw2qVb1rIaXghI+dEJB8CPlZQOdpBU/DmKvVcCQvvOXTrQpc
	+34Uo1l+FNNdAkj7ep+XrMA==
X-Received: from pgvc25.prod.google.com ([2002:a65:6199:0:b0:c9a:7d91:9924])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4304:b0:3dd:85aa:4522 with SMTP id adf61e73a8af0-3dd8c4ef573mr13293913637.29.1789912216415;
 Sun, 20 Sep 2026 06:50:16 -0700 (PDT)
Date: Sun, 20 Sep 2026 21:49:10 +0800
In-Reply-To: <1ddc5181-f547-465c-bfbe-dbf14a91493e@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAE14pdek6ynze+muDZrK+yNX-3ioe3vprxOA4W22qokg352tJQ@mail.gmail.com>
 <20260918143809.3034592-1-stanleyjhu@google.com> <20260918143809.3034592-3-stanleyjhu@google.com>
 <1ddc5181-f547-465c-bfbe-dbf14a91493e@acm.org>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260920135014.3528082-1-stanleyjhu@google.com>
Subject: Re: [PATCH v2 2/2] scsi: ufs: core: Decouple CQ sweep from request
 iterator in MCQ
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Stanley Jhu <stanleyjhu@google.com>, linux-scsi@vger.kernel.org, 
	"Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Peter Wang <peter.wang@mediatek.com>, Bean Huo <beanhuo@micron.com>, 
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 9/18/26 9:06 AM, Bart Van Assche wrote:
> Forcibly completing SCSI commands from inside the UFS SCSI host reset
> error handling callback is incompatible with the SCSI core error
> handler. The "force_compl" behavior should be removed instead of
> reworking it. If you take a look at the SDB (single doorbell) code you
> will see that forcibly completing requests doesn't happen for SDB mode.

Note that ufshcd_mcq_force_compl_one() already checks
!test_bit(SCMD_STATE_COMPLETE, &cmd->state), so it only completes non-EH
commands (e.g. during an autonomous ufshcd_err_handler() reset); in SDB
mode, ufshcd_hba_stop() (HCE = 0) clears UTRLDBR to 0, so ufshcd_poll()
similarly treats all outstanding_reqs as completed right after
ufshcd_hba_stop().

That said, doing this inside ufshcd_host_reset_and_restore() right after
ufshcd_hba_stop() is indeed the wrong place: at controller stop time we
should only release LLD resources (ufshcd_release_scsi_cmd()), and
requeue any remaining non-EH (!SCMD_STATE_COMPLETE) commands with
DID_REQUEUE only after host/link recovery finishes (so autonomous resets
neither wake callers mid-reset nor leave in-flight I/O stalled for the
30s block layer timeout, similar to autonomous reset handling in
hisi_sas, megaraid_sas, and smartpqi).

Let's drop this v2 series. I will send a separate 2-patch series shortly
to replace this and remove force_compl and
ufshcd_mcq_compl_all_cqes_lock().

Thanks,

Stanley
