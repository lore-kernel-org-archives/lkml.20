Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429687;
	b=RDFqilWj2UfTgPA4OJAsZEkNFrKOssDf2CVuxTg2gJTIOGw3V4PtZxD0RtBNXQDLP1oT
	 N6u+SIqHkQlt0TuBYS654pvVMTiCLV+FojyF2sdB5t4z9rs0t/enAeeoTpLgyQkWwgVwd
	 xMtigS/M5bJPly7y8WAICmd7qknVqTyg07daY0MiP7LNm625cfzdscX+wvah5qWCvqwy6
	 tl5A5gbBCx+ObTq2DATVL9RORs0hoQe2hvkfhfpO+DM72QcXajruIqyAVcfxTzoSuJcTC
	 LiMqnnifDlmQFxy8Tm6tMPin4WVgTXgetcPSkin7PocNPNyGFeT9rWhuoxqbPa2xh+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z9Rf2ubDKz7ML74MPtfck2qyU1vrqP5ztLplisyq7v8=;
	b=g7J/t8DJx7Sx6Rxw2nBlsgjwRyhbJbtVm/BEcmYc0XbSOWre8Jx+Webei72cynYBJmFj
	 bYTr1K5KPEgFXDCGFk+tGw+AohvuqsQ26QSJgZMBOI5vxKYcTqy3Gab1G9W2MhwAmDXUY
	 6D4krS1KFMD/ekcY7pP2V73ke8fzzBuztxIVOHLxtqw+NvDb4gocvQhfW3kJdtNnfOgbk
	 lb85luF/k6A00TS/GD7RKRaFAGGhf/7mUOQTtcwW1OnfpXokb0a1eCGEMp0YCUrVvQTo8
	 LnD2lNda4fb2HaE7CwzvRSYVSMpDM/UxExYXzmEiZji4dpeXeWidfy1+dkp1v+3XTYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hN5V4SND;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D4C606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00D4C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hN5V4SND
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1436723f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429685; x=1793034485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9Rf2ubDKz7ML74MPtfck2qyU1vrqP5ztLplisyq7v8=;
        b=hN5V4SNDE/HFB3N3cv5LHldWsl4SYF+12521DFRCCiZpfDuORmspN/Um2jdLYJZoY3
         zUWtmNM5qdCPIMuIJ8hlUTR2/APPnKF/kKILGKtIsqLGPiOgOtjzqhJ10OQZIfDprErE
         ucTxHQ1/E+h2jQW3sMFeGl98+8ktAINYbs5T1tLJZxxaMvX5TMLGK8b7NCMTNx8aFnBb
         QieABdzmmJZWvEzafqMUHjcuK78YK2rpg6tPRQ9eonHahpzWzC2bdYR/5JeiEBa+Ve0C
         sRDYhXJnwGYdsuOiOhyDKPNfjUsH2MlB7BqqgnL35qv/WBNZ5d7f5piomeMhpihfnwHo
         9S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429685; x=1793034485;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9Rf2ubDKz7ML74MPtfck2qyU1vrqP5ztLplisyq7v8=;
        b=Iuaj6Du7dixqQy6nfLGA0FvfVB+DUzTcUmS3b21WFyOMocLrWKHKlURCmzvS3pHIKr
         A1QaBUbOhpFbL8xNTKedyA0G95LxG1EXKvvP0iHd7Yc9cvuxuZmQalG2a82NOHqsVlbh
         Dv4lIW8Ip5/jZnAP1pGzuxbpmozLYHBd4JOLrSK2oDoZSCq9WYid+zFWn0aILqI/Xaqw
         SZAab3GfGbUovb0p9BecbA3l2Vy7uEADzKzQbnhnPEBzliCoqeSNDfQcCNm4qjKduve8
         Ujz3Bwh8Nb0i3hiF9aGBiC5cXL43ilyTqPR6yGcVcZBE6AiKgnysZCRDKJOJLiJer8ke
         wNaA==
X-Forwarded-Encrypted: i=1; AKwUvBz774utxt+xWBU0KOF8lUzwblB+hVVJELFrlwl2TNaHpKDyvT3fti7d+NNGD41VpQrpmeSRswc/w7pqVUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3Dx8hp1FzoPDcpARIUkQ0nXbKTpxcB/RCn2Mj/ahAZpkR5DHQ
	agax3uDBHt/Uv8g3ED/AEM8J77rMpCsMx1h3HKB6mjKj6dE8yHFnsNxP
X-Gm-Gg: AYBFou3S8CCk4SWyNCpAVCBhJ8y3OFwtdCofPNUmHzO8pN/yq2v/1RNI0n2gtwcOXaF
	X7nlPeulLWr/Mi18rMTRYJgKiSvvjfiqKKs2ZU8Se1jPPewNQ9zgot3msNeiDx7Bc+PoGkaQC8o
	Qv8rdr3OyavkqcJtdVtU6UMuYjcL5XzRCD/pw9DAgZFspUtbMaqJRkpPuTEsHE3tRGdoLy2aOww
	HFbz/oKUC6rDadUyaM3hH7XCvdSmsWOTMNOf+kFu/D73KQGab4pMxfEI7hClt+/7RnloobQYn1B
	UjujTVu5rkGyvF/jvy8B2GtF16PqJNdyvdV9cVK0y1xL6ucr4QvJo1402wIZrKwcWSDR/9p3zye
	JZg0IcxFI2bzcNkrsHpPaEv9Gi/oIXoPJAzdcJ+Z1Kx1Gq69l7SuxuE50Ts4J+B44fmV5xHh86O
	LZi/lHhWK/dlcXFjijnLwWZ/wvwFyg5t/gEDzEzs50AQ+1bLIG8JpOgH4XK3do3pcYaPANj9j/N
	sz1sKXmAQhsAohxHqDg2xvdIc0LYM5JTII=
X-Received: by 2002:adf:e78f:0:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48e07f99fa0mr12300471f8f.41.1792429685165;
        Mon, 19 Oct 2026 10:08:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818237sm146817f8f.27.2026.10.19.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:08:04 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:08:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, oe-kbuild-all@lists.linux.dev, Linux Memory Management
 List <linux-mm@kvack.org>, Luis Chamberlain <mcgrof@kernel.org>, Andrey
 Grodzovsky <andrey.grodzovsky@crowdstrike.com>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v2 next 03/15] kallsyms: Improve selftest
 test_perf_kallsyms_lookup_name() output
Message-ID: <20261019180803.3ff8c35b@pumpkin>
In-Reply-To: <202610192356.CItNLOke-lkp@intel.com>
References: <20261018155206.132411-4-david.laight.linux@gmail.com>
	<202610192356.CItNLOke-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 00:07:48 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v7.3]
> [cannot apply to next-20261016 next-20261016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/kallsyms-scripts-kallsyms-c-Avoid-overrunning-on-stack-buffer/20261018-165152
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261018155206.132411-4-david.laight.linux%40gmail.com
> patch subject: [PATCH v2 next 03/15] kallsyms: Improve selftest test_perf_kallsyms_lookup_name() output
> config: nios2-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261019/202610192356.CItNLOke-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610192356.CItNLOke-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610192356.CItNLOke-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/kallsyms_selftest.c:70:1: warning: 'The_time_has_come_the_Walrus_said_To_talk_of_many_things_Of_shoes_and_ships_and_sealing_wax_Of_cabbages_and_kings_And_why_the_sea_is_boiling_hot_And_whether_pigs_have_wings_O_Oysters_said_the_Carpenter_Youve_had_a_pleasant_run_Shall_we_be_trotting_home_again_But_answer_came_there_none_And_this_was_scarcely_odd_because_Theyd_eaten_every_one_The_moon_was_shining_sulkily_Because_she_thought_the_sun_Had_got_no_business_to_be_there_After_the_day_was_done_Its_very_rude_of_him_she_said_To_come_and_spoil_the_fun' defined but not used [-Wunused-variable]  
...

Already noted, it depends on the build options.
I'll use the same 'trick' as done for the other static symbols
(that is reference it from a non-static function).

David
