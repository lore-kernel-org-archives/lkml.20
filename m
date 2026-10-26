Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036676;
	b=mZD+8HKmdKsRPD9QJWAPH3Mxj9CrVczbNYm3TE/Nq7GB7JD/rNpnoK/fUof/pk6Z78Ga
	 X5spTa+uneXpiOWB7OWCHp6fVwT6/KQXVdf9SRZCyhBNHg5bNXLMyGqob/2uG5PSrNhf8
	 3bGH279pEWK81GQx69igkxOLzZLCXnNG6hm72PUiyWGNYg01WJ3yK6VF/4+F81DdoaIJ/
	 Q0NAvFgmATVslDq+CYDlAm3JibDtHswPKqA07EqSpptruQncppVLdfp1X8akUcJ32v7Nd
	 qgzVlI1JLbr6OcZEXZFbkCcoBi2c4Vn32SA4Y2Q3EHCgNJDpub+rLGSD5hjjTEwWcVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036676;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=f6y36bPmf5PYIQMIQqGrqnGg+8VkCKjtB/pzDKkd0lg=;
	b=1sF+7RtYrFie2DSYaonhCKJ78WM4tZ5G5ueUZIaCXRmuFK1gosMQ4eaq49ix8g5/8lg+
	 8UWxSpHB8Br240tUalVjcGy0MmRfrRPp6ktYJLpxDUjSjSsh3sOuLxnHOfocXzEFuJsI3
	 EIem1kuIH8JuQPK6Ek129w1mMnj7+dMkykBrXjm1l1eQ7VVqoaheMcRhn5m0az99EtI+M
	 gNKaOP2wtO4L8ASIwg6A17UgzI198LYju6ihAbhYN79AarbPusd/OlwW8ShYmpu689E4J
	 Mue4OHlY+lM3MLJlKWf4FSqlFEduishb8EIHa6OFdrKMiC9UWYZ+1L4k9tviNUMQ8Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=JGIvVpm2;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7EB606A31A;
	Mon, 26 Oct 2026 17:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=JGIvVpm2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793036672; x=1793641472; i=arc@gmx.li;
	bh=f6y36bPmf5PYIQMIQqGrqnGg+8VkCKjtB/pzDKkd0lg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JGIvVpm26+J3kofjQvrAiPMDIqVxMun38p7/ZtahAVcUpwoJGXj/OmXdeUKGFX53
	 N1xqgOvDjiQVNhbld2i0Br/IUtdRsyeMI23E4vQ8xZUu1hF5WHaPCHgdI3gshCN9c
	 +sIVSFu1Y/uw2Lfk+s0UaaHR/G/VcTr/FDeGq8jQ9siRTWdK+oYbzRs8MdEHAe0z5
	 BEorODuFFWgkhZYIPsAazK9HXU0ndTy3BcJPId5ckn4IS+QjwEPIKdjGVgiqv2xfm
	 YgF8YkyUoo4ONRfzJxCq3a4135aQfbbbo1IKboKnEQUr3RtdHLvRVjRTNqRv+8FLm
	 1LKqP9CwbuQF5y1cMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1wRFIC0hH2-014h5o; Mon, 26
 Oct 2026 18:44:32 +0100
From: Christian Ruppert <arc@gmx.li>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: arc@gmx.li,
	mrwillporter@gmail.com
Subject: [PATCH 0/4] ALSA: mixer_evo: minor fixes and tlv addition
Date: Mon, 26 Oct 2026 18:44:22 +0100
Message-ID: <20261026174427.24947-1-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jPsOj7veOHc6E9RgAftKaAeXP0e7k7oHaQehjKIdW+FuA7Qya1c
 TWUdNxkTAwUZZFRM70p8yVAE50cIGvrlNu+FKT7C0ycUzMV6QDNh1PYfMi6lpzchCv0b1q1
 DaEojJ2JTzlgK3TXBqrx3vhVoK/qc8/xLpZmtj3VcuhOxzetsfGAkipHQNIdRpD71wnOAI8
 4UeikoUrRVRdA/2IGmiLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CyJXD65ZG/4=;wyuG6Vp9gHa+CLTXJQkvleuQmOu
 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

This patch set contains fixes for minor issues discovered while reviewing
the proposed audient_id driver as well as the tlv definition for the
recording mixer channels. Thanks to Will Porter for triggering this with
his submission.

Christian Ruppert (4):
  ALSA: mixer_evo: Remove double end marker device list
  ALSA: mixer_evo: Add missing snd_usb_lock calls
  ALSA: mixer_evo: Fix endianness of boolean inversion
  ALSA: mixer_evo: Add tlv for mixer channels

 sound/usb/mixer_evo.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

=2D-=20
2.56.0

