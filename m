Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963825;
	b=myJcB0iRSJZbgtY+73M3FylICq2wH5op3BrRaNQxFyOWXqxrPB/ncHJf4tvhlQ+fbPGi
	 AkWUaaQZVkk2m/CkOgxfB3bldrGBbXi3+C12BE01uKDw9F7EvIRoVoGJP4sOx6cwFbN71
	 RgTbqMPBmMul/KBV79o6tsR/dds1xFVt3FTsLKKlfXf3xiNTHa4ilDo2uFnCrQNuUCFLr
	 3iGkHVey/RZNjzpAC5NYogA0HHNoh4U34Gz8mY8/KqW7Tu0ZA8XETH10maRw2IWKotZln
	 edO+dPFwZlKZjqAXIuXORTdOknW578Os98K4+GNbs/x0+v1HBkAyR+9/tEFX/eyCGAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xSo6YJyFeQ1zMbTyziwWYIcuPb7sycKW/4CokJbJ79A=;
	b=gjuQN7wSd3sixrS9ZVPmFbwFL30voIHnGEGHLuLZ3WvkGcg6r8i6Z7QQF67tvSe0ZZWr
	 1wjVFIhMl8PdI0Gug1Yd+NTOTkZF0pf/PBtAD2AK2Mq6z7w2C7qDVPBFtWPqeQvBKMTPU
	 9DCNSn3OzX4Ah7PBZFFP2jbq5LTJGddsQHhL6Am4FOoGGzV4Z+1WO+j46BrwvxEKmgLaB
	 Gpj/Gv39pZnKyg5F8bEopdG/fufmXtXEgpnUBHP6bHOWUB2LDtoab+Idx6XE7p5LmhBpK
	 A6kBJPfcYwUzXh87T0yqMgjfQaUf3Iy/ujAuWdWlOhbu4yf3wfXcVO8X/W+AMFl1tew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JZIdBnWy;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E78606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E78606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JZIdBnWy
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso355089166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792963823; x=1793568623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSo6YJyFeQ1zMbTyziwWYIcuPb7sycKW/4CokJbJ79A=;
        b=JZIdBnWyoWNxwt0dJMClhHkij7U/cXI8BSQM3pCxVUOjKg5NdEIVx9wZf7hJIG//cY
         vRlT8JSCdS9ZVgqp1fmrr/6FQILnYuQR1v3KovBDPUN9nu7SwE2NGCiMfd5KRTjGudQH
         dxo1SpIygBmtfPsfwDxzaK80fWhWKQcQhZ/1ix3Zqou77fhKBHQCT2uv+5HxGUW2ULxg
         MOqQo1sJc2Gp4ZpUhTFGjsWObTH8safBwhtbtDvTGG9T8FOpG719OPd8znP8Ge8SM7LP
         +hvXvrupHKzBNXKVFE6OvpvnS/pKolFe5fM8MtseMOYdKDb7YSUiQBdmuzFUlwvWOFwg
         HDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792963823; x=1793568623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSo6YJyFeQ1zMbTyziwWYIcuPb7sycKW/4CokJbJ79A=;
        b=FtWv1rsaG6Np98nfxvY5rUgzZ+qSamTHFOaMehc1X4t3yXWfdl30rtfF6fO1+cHZp+
         OfFezyt7Pi/UcTVfxDgBwcFiJ5TYlzhH9wgvAmiPL1uUUkI44OedN78Ny2Z22nMZtf/D
         WtkXHzALZYOaaM+A3iEWLQ7I+w9o2xQJ+7cGFFrvKstyRDvOx41oahs6mzThJGTbTJlP
         l7yXheDrs4UJNgA02CY9ExXWrVsGPZcw2d4j2dbse4yx1r9VGqC20Rr5/uc0NRrr//1+
         iyXFzugpXo08oVCjk2lrFvQ++matG1/Mcz4w2CRaes/6SzDJSC69e3YPqKIz/nKpSY13
         b/PA==
X-Forwarded-Encrypted: i=1; AKwUvByrrnw+srW1lBP2N6etXRglpx/A66MzImF16eV5MVZ87i32f9D8p9UC17/6PyunxcqF8L3xjf/UgKClY3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu4rWpxVIn7izS2WLlzIFIh+m30/FJOexPwJ+RdukGuOpfHuir
	7MzfN+dJ47jR5Ti8VClZ2CvQpguv7U9EmDmRiCYeZ1RHDHjSdIsDpRze
X-Gm-Gg: AYBFou2no2/D9ev2ZeP2v6QdXGu/Qo64oml4FEcyZ0A7m9em4VJRNfNelX49IQcs3XT
	7JdFoVA+K6SzaxxxfqnCAbUqf9geFEitfSp25A3byRS9BVdk5JFYBPceNbtSB17BvkONxI5ZNRl
	2aTFHWRd8slzSCRP4M2LiYYucDlchG0Nk0ECtenaJryykdI44sYmlJJ+4dIB+HT0wLET8I8XCRi
	ju+jgXU+INIV1dp/HiJe2Tc3aw4bU2sqqLdn/S7xkcr7qzph+yAAmx0HULpTcQelvTvF7Qq2NiL
	EDP4vuLBs9MptGO3WXEPhzWn7jzJb5mjEFt3uupKuWMF9ENS8VqcH76CJJQIUN/egVv/aAkHmfJ
	4D/s/s5X4eGp5ejfsKfl1lCpa9bhWluj5hWFCFm2eIm6tP0XlU5PRH5ryzd//mpi2Wz7iHuO0X5
	vQI8md2g1qa0T7522PnAUDXI1lUJPljWi/gLFnT2Cj4RCA7B/EAOk1K4y2SPMEBGnQTyFnBYsmk
	it90VpTEVnCDSrBMsoBq5iaJnqQqOPWRADk0OGH9tva3NBdo4Ut4ILCJpbw3l8=
X-Received: by 2002:a17:907:2d92:b0:c40:f9ea:7375 with SMTP id a640c23a62f3a-c46bddaed7cmr675175366b.15.1792963822908;
        Sun, 25 Oct 2026 14:30:22 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79eb05sm244744266b.79.2026.10.25.14.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:30:22 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-bluetooth@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_qca: Reprobe QCA6390 after hibernation
Date: Sun, 25 Oct 2026 23:30:13 +0200
Message-ID: <20261025213013.12956-1-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atXiYxot6UZ3MDrp@makrotopia.org>
References: <20261017174310.22484-1-nbryskin@gmail.com> <atXiYxot6UZ3MDrp@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daniel,

On Mon, Oct 19, 2026 at 09:30:06AM +0000, Daniel Golle wrote:
> Would you be fine basing your patch on it once it has landed?

Yes, thanks for the review. I'll send v2 on top of
device_schedule_reprobe() once it has landed, with qca_restore() as
you suggest.

I tried the combination in the meantime: v4 1/4 plus hci_qca converted
as above, on 7.2.11 on a Dell XPS 13 9310 (QCA6390 on UART, no BT_EN
GPIO). After resume from hibernation the reprobe ran, the firmware was
downloaded again and Bluetooth worked; s2idle suspend did not trigger
a reprobe. I've replied to 1/4 with a Tested-by.

Nikolay
