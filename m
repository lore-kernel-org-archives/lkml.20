Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC72FE59C;
	Sun, 13 Sep 2026 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789300151; cv=none; b=CKEi7SH+Gz6M5AM/WB4sQIOxtt1+Rh6OkqpHfNc2542am6NplhQl0Cy0dh4rBm+MtEKv7TUkQEaj4E/N3ESHsE4lBHqoEyx9AM+rpOXeLDl0SOdFXGXSmgLnaD4sWM5Bkj+8nV1X8dvSdfy3U/53a73lf1ma/R6/gQ+vvkCKrao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789300151; c=relaxed/simple;
	bh=xarFaKIRnVZwU3LvIHprFs9kJxYTTDsrsTvTWyMGsq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBOrpGypOuOKiUXRMVZuuS3MXAp2aEnfoqyX6F4e+guwPmp2dAF2hu8Nmo7ozS975sPEqNf+R86ZaktUEjS/mpWL0kEA2r94Z0LoMlvS61GGoEj0zeogRjU9Fwa3L5Bch2H+NSwcwp2NAvrMQCrj0s0GLGf+X20OZVFE5ir4zzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkfS/fCJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkfS/fCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789300150; x=1820836150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xarFaKIRnVZwU3LvIHprFs9kJxYTTDsrsTvTWyMGsq0=;
  b=PkfS/fCJrQ3vswgnetDzO4gbm1UTtpNoQ/qhQmkLB202lu+pxd5Z7LAB
   iB5QfeyG/W8G/1VOo8LK5VN8Yj43l7iivOKtx9UIbgPwn9Fw/JfdOlI/Y
   /2P7lWFnD41TWZCu2iMD5BinWfN59apCbOjoHT5pcPfrxAeXbAbfMbuMy
   D7JJwFcSIc4oZYZ+8UUL+Qf0suI6/E6+gveS/Rd8RJ7eQcATqMPWc1e8D
   05U4LvDDUOv6uBnK+xOss6W4PnfF4TblrZ2bwyFlH/FxHzJmYAnIdy1DY
   99m9O8vSIrAvpZeBIhZC69tILMruf7wObKg8CsML5WuxvA7OWrCX512r9
   Q==;
X-CSE-ConnectionGUID: zhPmwAqyQkmwU3StzObAlw==
X-CSE-MsgGUID: TAdwSiHEQRekJXJE7Tx9Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="93510288"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="93510288"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 04:49:09 -0700
X-CSE-ConnectionGUID: X6rExy9wSiqL/WR6TygNLQ==
X-CSE-MsgGUID: llvG5sCSTcmGA9h9AiPrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="295867788"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 04:49:07 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan <ruslan.panasiuk@gmail.com>
Subject: Re: [PATCH] ALSA: seq: midi: wait for output buffer space on non-atomic delivery
Date: Sun, 13 Sep 2026 19:48:58 +0800
Message-ID: <20260913114858.585502-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87fqzrah55.wl-tiwai@suse.de>
References: <20260831143200.412572-1-junjie.cao@intel.com> <871pbddz5k.wl-tiwai@suse.de> <20260901143803.422827-1-junjie.cao@intel.com> <87fqzrah55.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 02 Sep 2026 15:59:18 +0200, Takashi Iwai wrote:
> When it's transferred as a direct delivery, it should
> just fail like the current version.

Direct delivery is the reported case, though: Chromium's
Web MIDI backend encodes SysEx into events of at most 256
bytes and sends each with snd_seq_event_output_direct(),
one write(2) per event, return value unchecked.  The
failure is invisible today: event_process_midi()
returns 0 after dump_midi() fails, so write(2) succeeds
and the tail of the SysEx is gone.  A writer that did
check would have nothing to wait on either, since poll()
reports the sender's pool, not the destination.

A direct event from a user client arrives in write(2)
context, so the push-back can copy it into the sender's
pool at the moment the destination reports "full"
(snd_seq_event_dup(), non-blocking); from then on it is
a cell like any queued one.  A blocking writer then
waits, before its next direct dispatch, until the pool
has room for the whole event.  That is the only sleep,
in snd_seq_write(), outside delivery.  Kernel clients
have no pool by default, so what they dispatch directly
(virmidi, MIDI thru) keeps the current drop.

> then one (or a few) of them might block while others
> can process fully.

A private copy per blocked destination sidesteps that:
the delivery loop completes as now and the original cell
is freed; only a destination that reported "full" keeps
a copy plus the consumed offset, and later events for it
queue behind the copy.  The copies come out of the
sender's pool, so a stuck destination eventually stalls
a blocking sender's other targets, where today it drops
for the stuck one and goes on; a per-connection cap on
parked cells, dropping beyond it as today, bounds that.
snd_seq_subscribers is the natural home for the copies,
with a list on the port's c_dest for events sent to an
explicit address.

On the resume side dump_var_event() already takes an
offset.  What is missing is a space-available callback
on rawmidi output for kernel users: runtime->event fires
on input only, and __snd_rawmidi_transmit_ack() would
have to schedule event_work the way the receive path
does.

I'll write this up as an RFC unless you'd rather see a
different shape first.
