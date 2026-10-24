Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792820920;
	b=Swmg3nSAkozTaSmwzfVkdz3izd+NFX59VfJYfni5ytg5e3bxyuhqge8mNosJfd+uXknk
	 pAcSDp9Gdv5oiXM6Ze7+goGJEPUK54C1qjP2e9eoBuY395RRZpWRZHxVDzZt16Cjg9TYu
	 JPDYQe0cTN1C8007mhzSdVDq8e8/XSI5ps2giGZCFEIS17KQsOOpbUUaQQKPPDFD9Dydu
	 AQiAFMr2Ne2ZsgTrecko05lBaz2O4aXc0Zibdz80jWHHlvdvsEo+yX5ODrRrXSa9aYnpG
	 Jzq1SGsN/hdu1dX7MvpmOMwG17oRonCy3k1fuqP9Cq4EDaWsnZ+nmwsYO20mQ3hy1QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6D6lOz4P8rDJmxVCDMDICqLLJN650pwKHNbrX64l7+4=;
	b=uCsTciaxyERWLl6EkKn0vYtjmJC6SZIHW18+tqpOuCyg+HHyJ7PGaYa4EbXMaeM6dHQa
	 PcXFn9NipPn8TvH0ErtJhFt0iJQJNj31qzkVkD7LnDYa+H2z2bsAiy8lQsUteQ6/CAxaG
	 P1Ye6Qik3H0iOtsK/LwHjWIOXQUPnBHiryzLwrfRobtZYmyxKSyNgWFMWYqSFJYFK3tL6
	 Zye+Di1mDDJhy98n20M8YkBEs06Fj/8Y3PvhQE5AEL49I+L+PrZzTGE3QXxUe1u+hxl6r
	 A9WULtdh6Sj/H/LBZ80tB5aAiGbQTKlk0QKVAgoZWhw76192Il+Ot+vZlQOoU+KZf+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MQ4Ux4MS;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE457606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE457606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MQ4Ux4MS
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36681e85e87so3860145eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792820919; x=1793425719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6D6lOz4P8rDJmxVCDMDICqLLJN650pwKHNbrX64l7+4=;
        b=MQ4Ux4MSSJOvA76JDEwDAWqrRgqKVRQdAX3P8Wm5QWhU30VvSBzD9axwGXhBzGaKqn
         lP86J1wRQKGBLRTy+Fktrz2yg8FaeBoxPDsk+XTgXUckb85JQ2DVRyxo4BIVLHaDDJKG
         RnpHBU3aJDq2wMlB1ROjdxoQUY5bbsoGv1fU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820919; x=1793425719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6D6lOz4P8rDJmxVCDMDICqLLJN650pwKHNbrX64l7+4=;
        b=vux6R5nogROqCTHGqtvQQ6I+qtli8DL/KRt/86JK4LJ9CfNIWbUI+7Y7NUxKW+pEXE
         BfXtCPzvDuFuqQkGBeA8k8fELzfvsAOWTdSFSHdySBQueAEufkvdTDRV86kvConFIHMJ
         diN0CI6Jz6pFPLpZBEU3NNE1m1ehOsQH1tk6SmUWTnefLsGtQPanEnHIENTYyVKPuryf
         GUfOrZLakKnL1AY674tajPbvrlLfjiAGngs6KYPHtF8m/qMqPaFD466vjIbxQsu+n0cG
         cDZpXcRMMXYo+nLnToC/9KusLy0zNI/4Ym/dlCYtyqEBUzmFFcuRuEU5QWoM4Cd8y0Uy
         XxiQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9Eqeo4o2yn56Jqd4+sPxQ9KGQjU7vm5ygW1UdNtDS9n69MCZWCio7tYNYtOxEVpaU4sHHMaALAkVbTCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI25cbDB2TNI5flAH3HVbVIH9s8RjINh768yrOOXo/cfdnOx0cI
	/QMNGRuAKF4Gxd3rHc5Ut9NPqF0mHy/JMUPfMNndNs1GKQ7GqwTDfPt690EZ6uO5BQ==
X-Gm-Gg: AYBFou14y3z3W5oDfcmNbiPXxlE2oUSVw0bZnAFqILg4LOdpgzUmvAMCEyTDDJeAorc
	nDLZOvkhzhvG8p5sr9ieFdcEzPkcRsNoCv6TLq4gSET0scsU/u34kIENH7d+wUMW5len5x+2SVA
	LTwDK8wMB0oCSbzQVNRZzfXLXijYs27klHCmNi0+078SxwQDuACvI+7bcP6JW8lQEVxzqEK9tI3
	V47s+stQd3TaHZgpVvCUeeTIw06odriYt21T/kTm3g/XPnIi26+R2U3hVZkvEGDxgZFFl6mb6en
	YY0C4zcE6ol6sji0beKKhcRCozepToQMD7PfijnYSkRfGsGOepTL06n3auwl9cn7hMx9WRr6y1V
	FxTJiHI5dt08AL400sabhpiNOLFJHWz2YGdThmSPINAmI0YoJdr4WGG6Mo4UdpqMCSQ5eAB3ZBE
	3oWZ3TtUt5YaCgJNzgsN/gOtUQjgOpgQLMYYD2FxTbvWuWwqEOoi1WLQ+Jw4J034Q3Iq1kYtm7d
	8wY4ap2aemt7KRhgGzS0atrvibLnezFCrQLkgIZHr/wAm/sbc9Hnpv4LcK5qSssPJkp5ui2tjsg
	kyJO8O4nOuoH119EuhDw+/879jrg6vbiXhY4ZlrZjA==
X-Received: by 2002:a05:7301:2284:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-369e848c506mr2557802eec.23.1792820918864;
        Fri, 23 Oct 2026 22:48:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:f7b9:fe46:772a:da49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm4221618eec.13.2026.10.23.22.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:48:37 -0700 (PDT)
Date: Sat, 24 Oct 2026 14:48:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hillf Danton <hdanton@sina.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Barry Song <21cnbao@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Brian Geffon <bgeffon@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Message-ID: <atxFgutP-N3UZex2@google.com>
References: <atrnvuQkeldgPqH5@google.com>
 <20261023114050.1011-1-hdanton@sina.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023114050.1011-1-hdanton@sina.com>

On (26/10/23 19:40), Hillf Danton wrote:
[..]
> > writers vs readers 3 runs
> > 
> >     BASE+PE     IOPS 1,271k  avg 5.57us  sd 1,393us  p99.99 27.5us  max 1,581,800us
> >                 IOPS 1,461k  avg 3.43us  sd    78us  p99.99 23.9us  max   227,015us
> >                 IOPS 1,444k  avg 3.48us  sd   222us  p99.99 23.9us  max   592,628us
> >     PATCHED+PE  IOPS 1,457k  avg 3.32us  sd    18us  p99.99 27.5us  max     5,620us
> >                 IOPS 1,464k  avg 3.31us  sd    17us  p99.99 24.2us  max     5,621us
> >                 IOPS 1,475k  avg 3.29us  sd    16us  p99.99 26.5us  max     5,620us

BASE+PE looked noisy, so I sat down and tested properly (also tested
zstd and various compression levels).

(PE enabled for all tests)

######## zstd compression level 3 W-vs-R
    BASE     IOPS 1,154k  avg 7.84us  sd   444us  max   697,634us
             IOPS 881k  avg 14.16us  sd 2,242us  max 1,387,000us
             IOPS 704k  avg 20.43us  sd 3,499us  max 2,058,300us
             IOPS 563k  avg 29.02us  sd 3,910us  max 1,649,800us
             IOPS 626k  avg 24.79us  sd 4,013us  max 2,085,800us
             IOPS 976k  avg 11.54us  sd 1,518us  max 1,165,800us
             IOPS 1,178k  avg 7.44us  sd    22us  max     3,103us
             IOPS 1,120k  avg 7.39us  sd    21us  max     7,222us
             IOPS 522k  avg 32.51us  sd 4,311us  max 1,598,300us
             IOPS 581k  avg 27.54us  sd 3,626us  max 1,448,600us
             IOPS 1,160k  avg 7.69us  sd   352us  max   702,099us
             IOPS 1,169k  avg 7.52us  sd   129us  max   281,428us
             IOPS 954k  avg 12.06us  sd 1,705us  max 1,545,600us
             IOPS 1,029k  avg 10.24us  sd 1,156us  max   976,065us
             IOPS 1,169k  avg 7.48us  sd    24us  max     4,305us
             IOPS 1,177k  avg 7.45us  sd    53us  max   118,777us
             IOPS 579k  avg 27.43us  sd 3,661us  max 1,615,800us
             IOPS 1,169k  avg 7.52us  sd   115us  max   228,074us
             IOPS 1,110k  avg 8.59us  sd   985us  max 1,288,000us
             IOPS 1,177k  avg 7.45us  sd    29us  max    72,245us
             IOPS 580k  avg 27.74us  sd 3,755us  max 1,507,000us
    PATCHED  IOPS 1,179k  avg 7.40us  sd    23us  max     7,404us
             IOPS 1,179k  avg 7.41us  sd    22us  max     2,857us
             IOPS 1,176k  avg 7.40us  sd    22us  max     6,615us
             IOPS 1,175k  avg 7.44us  sd    23us  max     5,623us
             IOPS 1,176k  avg 7.42us  sd    24us  max     5,625us
             IOPS 1,173k  avg 7.42us  sd    24us  max     5,632us
             IOPS 1,172k  avg 7.41us  sd    23us  max     6,223us
             IOPS 1,173k  avg 7.40us  sd    25us  max     5,848us
             IOPS 1,173k  avg 7.40us  sd    24us  max     7,563us
             IOPS 1,172k  avg 7.42us  sd    24us  max     5,625us
             IOPS 1,175k  avg 7.42us  sd    23us  max     5,626us
             IOPS 1,177k  avg 7.42us  sd    23us  max     4,243us
             IOPS 1,170k  avg 7.46us  sd    25us  max     5,622us
             IOPS 1,178k  avg 7.40us  sd    22us  max     3,213us
             IOPS 1,167k  avg 7.43us  sd    25us  max     7,593us
             IOPS 1,174k  avg 7.44us  sd    23us  max     6,971us
             IOPS 1,179k  avg 7.38us  sd    23us  max     3,477us
             IOPS 1,180k  avg 7.39us  sd    23us  max     2,894us
             IOPS 1,145k  avg 7.37us  sd    21us  max     4,048us
             IOPS 1,177k  avg 7.38us  sd    22us  max     5,620us
             IOPS 1,177k  avg 7.40us  sd    23us  max     5,623us

    IOPS: BASE 932k (+-260k), PATCHED 1,174k (+-7k), 21 runs each.
          significant difference at 95% confidence: PATCHED is 241k (25.9%) higher; 95% CI [+136k, +353k], Welch's t-test p = 0.000
    max latency: BASE 3.1..2,085.8 ms, PATCHED 2.9..7.6 ms
          runs with max over 100 ms: BASE 17 of 21, PATCHED 0 of 21; over 1 s: BASE 11 of 21, PATCHED 0 of 21

######## zstd compression level 12 W-vs-R
    BASE     IOPS 690k  avg 21.53us  sd 3,088us  max 1,635,500us
             IOPS 478k  avg 36.51us  sd 4,385us  max 1,941,300us
             IOPS 822k  avg 16.13us  sd 2,865us  max 2,263,800us
             IOPS 1,161k  avg 7.73us  sd   114us  max   190,307us
             IOPS 780k  avg 17.56us  sd 2,717us  max 1,550,500us
             IOPS 1,166k  avg 7.66us  sd    40us  max    94,522us
             IOPS 585k  avg 27.51us  sd 3,847us  max 1,550,600us
             IOPS 1,147k  avg 7.97us  sd   344us  max   496,483us
             IOPS 1,166k  avg 7.64us  sd    49us  max   115,243us
             IOPS 1,163k  avg 7.66us  sd    23us  max     7,006us
             IOPS 1,071k  avg 9.42us  sd 1,489us  max 1,915,500us
             IOPS 962k  avg 11.88us  sd 2,168us  max 1,904,500us
             IOPS 607k  avg 26.05us  sd 3,538us  max 1,591,100us
             IOPS 1,167k  avg 7.63us  sd    23us  max     2,903us
             IOPS 1,157k  avg 7.78us  sd   198us  max   418,930us
             IOPS 1,163k  avg 7.66us  sd    40us  max   100,346us
             IOPS 1,162k  avg 7.70us  sd    32us  max    82,602us
             IOPS 488k  avg 35.43us  sd 4,340us  max 1,786,400us
             IOPS 563k  avg 28.85us  sd 3,989us  max 2,209,500us
             IOPS 843k  avg 15.43us  sd 2,490us  max 1,572,100us
             IOPS 604k  avg 26.30us  sd 3,560us  max 1,555,700us
    PATCHED  IOPS 1,166k  avg 7.60us  sd    23us  max     5,623us
             IOPS 1,169k  avg 7.58us  sd    23us  max     5,629us
             IOPS 1,157k  avg 7.67us  sd    27us  max     5,639us
             IOPS 1,166k  avg 7.61us  sd    24us  max     5,644us
             IOPS 1,160k  avg 7.64us  sd    26us  max     7,543us
             IOPS 1,167k  avg 7.60us  sd    24us  max     7,514us
             IOPS 1,160k  avg 7.61us  sd    25us  max     6,643us
             IOPS 1,162k  avg 7.65us  sd    25us  max     7,315us
             IOPS 1,161k  avg 7.66us  sd    24us  max     6,237us
             IOPS 1,158k  avg 7.62us  sd    27us  max     7,688us
             IOPS 1,167k  avg 7.58us  sd    24us  max     5,637us
             IOPS 1,165k  avg 7.59us  sd    24us  max     7,098us
             IOPS 948k  avg 7.58us  sd    23us  max     7,808us
             IOPS 1,166k  avg 7.60us  sd    24us  max     5,621us
             IOPS 1,166k  avg 7.58us  sd    24us  max     5,672us
             IOPS 1,162k  avg 7.65us  sd    25us  max     6,824us
             IOPS 1,165k  avg 7.59us  sd    24us  max     7,078us
             IOPS 1,168k  avg 7.58us  sd    23us  max     6,191us
             IOPS 1,170k  avg 7.56us  sd    22us  max     2,851us
             IOPS 1,171k  avg 7.55us  sd    22us  max     2,834us
             IOPS 1,166k  avg 7.59us  sd    24us  max     5,627us

    IOPS: BASE 902k (+-269k), PATCHED 1,154k (+-47k), 21 runs each.
          significant difference at 95% confidence: PATCHED is 252k (27.9%) higher; 95% CI [+142k, +367k], Welch's t-test p = 0.000
    max latency: BASE 2.9..2,263.8 ms, PATCHED 2.8..7.8 ms
          runs with max over 100 ms: BASE 17 of 21, PATCHED 0 of 21; over 1 s: BASE 12 of 21, PATCHED 0 of 21

######## lz4 W-vs-R
    BASE     IOPS 1,422k  avg 3.84us  sd   418us  max   619,495us
             IOPS 1,450k  avg 3.57us  sd   326us  max   609,723us
             IOPS 1,414k  avg 3.92us  sd   543us  max   879,815us
             IOPS 1,451k  avg 3.56us  sd   253us  max   503,428us
             IOPS 1,460k  avg 3.40us  sd    68us  max   135,825us
             IOPS 1,413k  avg 3.31us  sd    44us  max   188,450us
             IOPS 1,432k  avg 3.73us  sd   503us  max   844,228us
             IOPS 1,387k  avg 4.20us  sd   719us  max   961,827us
             IOPS 1,464k  avg 3.38us  sd    44us  max   133,675us
             IOPS 1,469k  avg 3.38us  sd    22us  max    65,812us
             IOPS 1,465k  avg 3.40us  sd    49us  max   111,788us
             IOPS 1,465k  avg 3.39us  sd    64us  max   174,040us
             IOPS 1,467k  avg 3.38us  sd    36us  max    97,821us
             IOPS 1,445k  avg 3.63us  sd   343us  max   671,026us
             IOPS 1,472k  avg 3.35us  sd    27us  max    86,795us
             IOPS 1,473k  avg 3.33us  sd    44us  max   138,096us
             IOPS 1,439k  avg 3.71us  sd   353us  max   619,815us
             IOPS 1,398k  avg 3.36us  sd    54us  max   206,815us
             IOPS 1,471k  avg 3.36us  sd    15us  max     2,832us
             IOPS 1,407k  avg 4.02us  sd   629us  max 1,074,800us
             IOPS 1,465k  avg 3.40us  sd    63us  max   158,779us
    PATCHED  IOPS 1,471k  avg 3.30us  sd    15us  max     6,946us
             IOPS 1,473k  avg 3.29us  sd    16us  max     5,618us
             IOPS 1,474k  avg 3.29us  sd    15us  max     5,615us
             IOPS 1,473k  avg 3.29us  sd    15us  max     5,625us
             IOPS 1,440k  avg 3.26us  sd    13us  max     2,829us
             IOPS 1,456k  avg 3.30us  sd    15us  max     5,623us
             IOPS 1,476k  avg 3.29us  sd    15us  max     2,835us
             IOPS 1,464k  avg 3.28us  sd    16us  max     6,063us
             IOPS 1,468k  avg 3.32us  sd    19us  max     6,692us
             IOPS 1,465k  avg 3.30us  sd    17us  max     6,834us
             IOPS 1,468k  avg 3.28us  sd    16us  max     7,268us
             IOPS 1,463k  avg 3.31us  sd    17us  max     6,480us
             IOPS 1,454k  avg 3.33us  sd    20us  max     8,418us
             IOPS 1,452k  avg 3.32us  sd    19us  max     5,621us
             IOPS 1,477k  avg 3.27us  sd    14us  max     2,834us
             IOPS 1,468k  avg 3.30us  sd    16us  max     5,617us
             IOPS 1,475k  avg 3.30us  sd    16us  max     3,884us
             IOPS 1,475k  avg 3.30us  sd    16us  max     5,692us
             IOPS 1,471k  avg 3.30us  sd    15us  max     5,616us
             IOPS 1,473k  avg 3.28us  sd    16us  max     7,014us
             IOPS 1,475k  avg 3.28us  sd    15us  max     5,616us

    IOPS: BASE 1,444k (+-27k), PATCHED 1,467k (+-10k), 21 runs each.
          significant difference at 95% confidence: PATCHED is 23k (1.6%) higher; 95% CI [+11k, +35k], Welch's t-test p = 0.001
    max latency: BASE 2.8..1,074.8 ms, PATCHED 2.8..8.4 ms
          runs with max over 100 ms: BASE 17 of 21, PATCHED 0 of 21; over 1 s: BASE 1 of 21, PATCHED 0 of 21
