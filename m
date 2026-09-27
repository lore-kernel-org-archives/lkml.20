Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057363B9D81
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512406; cv=none; b=Yvw0YtTMNbm/HxqGWnJajaFlkYG1aG22YfcXAjfL2NYRx5WZzYMOxM6GUjGcTIKwtUAJ1W2nwk1adBl4e/4gMNbZfA0LP0tLZhyhQ9bG+5iN0shqYP+0tPDlO6c22z4cxdvc40bZkAv/98bZI9ipCDYuGVErzUb5hSMgfQhHaeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512406; c=relaxed/simple;
	bh=nQ2w0W6D/4V7cw99N/Ds4M/Z+Avm974MWE0TCUkiwdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1SpKu9bG3PS1lGZ8sAKNpvddAqDULL7VjJJyNdoPCi2mcRHM3Cw1kKJZtD7ovQNBeJfpbNZZKYqV2oBAGFKtS9EPs2A3h/6JIrTdrW1fvpTZxNDlBVso9r5eScSjvRvxA+Uw6B1tze0J4+MnhAOAPeOsNGoNckH/99lhx9/lN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fAucB8RW; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fAucB8RW"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso735933f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790512402; x=1791117202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hbiJTgzFfw8It2zbAnH/Tz+EUupQV4rXaAl/t+b96oo=;
        b=fAucB8RWVhJxb60g+gnPcQREp6OKMeYkxlDoqfxpC5oL50pUs4nTYBd1+Ygb68qSbQ
         IFXmdZEGzlADXIqcofemFTWLy8mLy3+ec/RDcpTEj+PDKGoJ6gkvgKApqikDgo9heEkf
         G9EuAgjE4uZ1ek5PObJnZRzQawlp6SCjLs23XXzai4fqfmQAj8qJcWwrB9oweiV7HVZs
         6+EEDhtKCw9kfaDHvaK5EsNi4bsH5PJY+D+WDxYenoaFOMVn1mw8COt//uTlTbcXeTX7
         bsmm5ZEfFOEfUbx2GSt0OwfEWN6bpuC/w71k1y8z+MGTZsVXNphwaFdcauGCzPklifyW
         dJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790512402; x=1791117202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbiJTgzFfw8It2zbAnH/Tz+EUupQV4rXaAl/t+b96oo=;
        b=0aTK+NwqUVDcJw92dfBERVmLgODUKnKRBgQQucedDnBlg82l0V4BrYeGPV+Txg+WEB
         0crlnvmJ5y0BBsoY0JotUN0ScARgT2a68u3JVjeeT9n2RebSZv1CX3plXE1gWDaxO5oi
         mabOL03paqDe6T0NecMZ9Ar98uWL3a9Qt5vlnn2gSb50CaQM3F+az9BWjhx2Apy5a7/q
         00kFWCjqPIcErj2ouZKLYvqF/cCClK6WXSIUhDCNbjJ377ZtI/l+RobM8d5vV0wY+fEN
         wFdhUpp7jnhJsD5ffPxzHGriqR6yDU3jlANUaPwztPcbCGLFP3bKCSQsg9RLwVWhbBaO
         EUhA==
X-Forwarded-Encrypted: i=1; AKwUvBz2NYGDoRKZ6dQbxcZ0Am1wL8s2xfvkC2dTKVIwRj4ZG5x98I4VXeZHblrgoyvy6TNAghMSUq/mW1v/3PE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYnLSivISh765ZINxgwkJgPPmxtTR+KfYnqUx3UFY5YaRd/iN9
	3O/lrMhyRVhjvmWC3uhHXyV2OYGlfzlI1idvtdi2pQhcJ35VibJSkM8ajVgjrZ4hONI=
X-Gm-Gg: AYBFou2FUUNnq3oJXYPz0mVtnTR7Uqgth7dTSPynsz+65DrXVYukOMzcKK/5qig7Hg8
	PgtROFjyvI0+hasfp6jA138vkkwSwh9XjVLW1cH8y97yRlcDcFFlO7LlBuER9LuZVPpGd9VvYnj
	BwFq1Qm67V1fPXFDkJTpvXkGTQN9+Locuew64uh9/ns894GXPrCAQsx+c6Sm8fIuv073nIzd9bR
	yfTJzo1MyzjURM9gWKXw0GSjmJiee7bFChRP/Xzz0AtNRfCmT3G2fvCGgL3eY0To5WI3TiBPMIH
	a9sW/AT24qDSK6Bya/OnTOdMAFuvwjLSGBpqSkooNlRjgfwc9/sWB7zNcKbISRjARPIQSjGkEZy
	U1TJ/KzV2jx2HEjCx3Vss9Lv7bdyV5bg3nSOn18GLheelTP9CiQtHLsS/NXxtSUroG1K+ONvbs9
	69EMqbsum6YVNTSLBV3RIYQfSoPXiSHAelxWr8Q7KE9uLW4YXKGhVt30by4iPOshR9T7PatxmVA
	EH9
X-Received: by 2002:a05:6000:200c:b0:488:7d24:fed8 with SMTP id ffacd0b85a97d-4887db08d79mr12645875f8f.22.1790512401676;
        Sun, 27 Sep 2026 05:33:21 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4887a34a314sm21099904f8f.6.2026.09.27.05.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:33:20 -0700 (PDT)
Date: Sun, 27 Sep 2026 14:33:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Albert Esteve <aesteve@redhat.com>, Brian Masney <bmasney@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, David Gow <david@davidgow.net>, 
	David Gstir <david@sigma-star.at>, Eric Biggers <ebiggers@kernel.org>, 
	Eric Chanudet <echanude@redhat.com>, Francois Dugast <francois.dugast@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Johannes Thumshirn <morbidrsa@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, 
	Julian Braha <julianbraha@gmail.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Nicolas Schier <nsc@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Waqar Hameed <whame@whame.dev>
Cc: lpcosse-keysigning@baylibre.com, users@linux.kernel.org, 
	linux-kernel@vger.kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: PGP keysigning at LPC/OSSE 2026
Message-ID: <lpcosse2026-keysigning-list@baylibre.com>
References: <lpcosse2026-keysigning@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ftx46fobm3z6npwj"
Content-Disposition: inline
In-Reply-To: <lpcosse2026-keysigning@baylibre.com>


--ftx46fobm3z6npwj
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="tw6ljmcahig6fsg7"
Content-Disposition: inline
Subject: Re: PGP keysigning at LPC/OSSE 2026
MIME-Version: 1.0


--tw6ljmcahig6fsg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

now that the registration deadline is over here comes the list
containing the registered participants in the attachment. In case of
transfer issues (e.g. MTAs reencoding the text file), the list is also
available at

	https://openpgpkey.baylibre.com/Fei9keem/keysigning-lpcosse26.txt

.

In reply to Krzysztof's concern about how trustworthy a statement
"yesyes, the fingerprint of my certificate on the list that this
suspicious guy created is correct" I dropped the two middle nibbles from
each fingerprint. So you can support your statement about your
fingerprint by providing these two.

Please print out the list, fill in the hash sums (which we will verify
when we meet), verify your fingerprint and memorize (or write down) the
missing nibbles (if you're on the list) and bring the list to the
meetings together with a pen and a proof of identity (as most people
will probably want to see such a document before certifying your UIDs).
If your hand writing is poor, I recommend filling in the hash sum before
printing. Note that the start of the SHA256 hash sum is already
prefilled, that prefill has to be kept as is when generating the hashes.

For people having missed the registration deadline: You can still bring
the prepared list and at least benefit partly from the simplification it
yields. For getting signatures I recommend bringing paper slips with
your UIDs and fingerprint. gpg-key2ps can create such paper slips. It
might be sensible to bring a few of those even if you're on the list for
those who attend the events without preparation.

We'll meet on Tue (2026-10-06) and Thu (2026-10-08) after the scheduled
conference events (Tue: ~ 19:50, Thu: ~ 18:30). We will meet outside the
conference venue, in case I manage to organise a room, someone at the
main exit will know.

For the procedure to actually sign the certificates, see
https://baylibre.com/blog/pgp-keysigning-2/. A bundle of all
certificates on the list is available at

	https://openpgpkey.baylibre.com/Fei9keem/keysigning-lpcosse26.pgp

If questions arise, don't hesitate to ask.

Looking forward to see you in Prague!
Uwe

--tw6ljmcahig6fsg7
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="keysigning-lpcosse26.txt"
Content-Transfer-Encoding: quoted-printable

     K E Y S I G N I N G   A T   L P C   A N D   O S S E   2 0 2 6=20

                     List of Participants  (v 1.0)


Here's what you have to do with this file:

(1) Print this UTF-8 encoded file to paper.

(2) Verify your own fingerprint and know the two skipped nibbles.

(3) Compute this file's SHA256 and RIPEMD160 checksums.

      gpg --print-md SHA256 keysigning-lpcosse26.txt
      gpg --print-md RIPEMD160 keysigning-lpcosse26.txt

(4) Fill in the hash values on the printout.

(5) Bring the printout, a pen, and proof of identity to the key signing eve=
nt.


SHA256 Checksum: 4E4F BA__   ____ ____   ____ ____   ____ ____

                 ____ ____   ____ ____   ____ ____   ____ ____             =
 [ ]

RIPEMD160 Checksum: ____ ____ ____ ____ ____    ____ ____ ____ ____ ____   =
 [ ]



001  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2026-09-15 [SC] [expires: 2030-09-14]
      FDFB 31C6 6E06 9650 D4A_  _096 B796 1F12 E964 645C
uid                      Albert Esteve <aesteve@redhat.com>

___________________________________________________________________________=
____

002  [ ] Fingerprint OK        [ ] ID OK
pub   ed25519 2025-09-03 [SC]
      A46D 3270 5865 AA3D DED_  _904 B7D2 DD27 5D7E C087
uid                      Brian Masney <bmasney@redhat.com>
uid                      Brian Masney <masneyb@gmail.com>
uid                      Brian Masney <masneyb@kernel.org>
uid                      Brian Masney <masneyb@onstation.org>

___________________________________________________________________________=
____

003  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2017-03-14 [SC] [expires: 2027-09-07]
      B3F2 469D 78D7 8BD0 9D3_  _F37 C940 35C2 1B4F 2AEB
uid                      Chen-Yu Tsai <wens@csie.org>
uid                      Chen-Yu Tsai <wens@freedesktop.org>
uid                      Chen-Yu Tsai <wens@kernel.org>
uid                      Chen-Yu Tsai <wenst@chromium.org>

___________________________________________________________________________=
____

004  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2021-05-17 [C] [expires: 2029-09-12]
      3B0A 53B1 D9DF 6AAC 59C_  _032 2A82 1C5A D66A B03F
uid                      David Gow <david@davidgow.net>
uid                      David Gow <david@ingeniumdigital.com>

___________________________________________________________________________=
____

005  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2013-07-01 [SCEA] [expires: 2027-06-25]
      528E 04A3 85E1 7DE8 6C1_  _384 9190 FDF5 234F E25C
uid                      David Gstir <david@sigma-star.at>

___________________________________________________________________________=
____

006  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2018-07-20 [SC] [expires: 2029-01-18]
      EB39 7C1F F130 EC7D 01E_  _445 02C7 A73D 84B0 447C
uid                      Eric Biggers <ebiggers@kernel.org>
uid                      Eric Biggers <ebiggers3@gmail.com>
uid                      Eric Biggers <ebiggers@google.com>

___________________________________________________________________________=
____

007  [ ] Fingerprint OK        [ ] ID OK
pub   ed25519 2026-07-29 [C] [expires: 2029-07-28]
      3CBC 2E67 5950 5DDD 089_  _514 E5DD 4DD9 6618 E621
uid                      Eric Chanudet <echanude@redhat.com>

___________________________________________________________________________=
____

008  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2026-09-17 [C] [expires: 2029-09-16]
      957E E65D 815B F6AF 886_  _467 0FEA 804F 4B07 2450
uid                      Francois Dugast <francois.dugast@intel.com>
uid                      Fran=C3=A7ois Dugast <francois@dugast.eu>

___________________________________________________________________________=
____

009  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2011-10-09 [SC] [expires: 2027-10-10]
      750D 82B0 A781 5431 5E2_  _25B 4804 B4BC 3F55 EEFB
uid                      Geert Uytterhoeven <geert@linux-m68k.org>
uid                      Geert Uytterhoeven (Glider bv) <geert@glider.be>
uid                      Geert Uytterhoeven (Glider bvba) <geert@glider.be>
uid                      Geert Uytterhoeven <Geert.Uytterhoeven@gmail.com>

___________________________________________________________________________=
____

010  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2017-03-04 [SC] [expires: 2028-09-18]
      F29F 26CF 27BA E1A9 719_  _6BD C3C9 2AAF 3E60 AED9
uid                      Jerome Brunet <jerome.brunet@gmail.com>
uid                      Jerome Brunet <jbrunet@baylibre.com>
uid                      Jerome Brunet <jbrunet@kernel.org>
uid                      Jerome Brunet <jerome@liltaz.com>

___________________________________________________________________________=
____

011  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2015-02-05 [SC] [expires: 2029-07-21]
      EC38 9CAB C2C4 F25D 860_  _0D0 0393 969D 2D76 0850
uid                      Johannes Thumshirn <jth@kernel.org>
uid                      Johannes Thumshirn <johannes@thumshirn-home.de>
uid                      Johannes Thumshirn <morbid@erlangen.ccc.de>
uid                      Johannes Thumshirn <morbidrsa@gmail.com>

___________________________________________________________________________=
____

012  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2026-06-05 [C] [expires: 2029-06-04]
      AB4C 460A 88D9 2792 88E_  _F93 29C9 3EA3 499D 9626
uid                      Joshua Crofts <joshua.crofts1@gmail.com>

___________________________________________________________________________=
____

013  [ ] Fingerprint OK        [ ] ID OK
pub   ed25519 2026-09-04 [C] [expires: 2028-09-03]
      DEF5 E89D 3A6C 6B7C 394_  _AA9 0664 101D 2FC2 52D1
uid                      Julian Braha <julianbraha@gmail.com>

___________________________________________________________________________=
____

014  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2011-10-04 [SC]
      7B87 460E 1692 7FA9 F5B_  _10C 5937 189A D3FB C665
uid                      Kevin Hilman <khilman@kernel.org>
uid                      Kevin Hilman <khilman@baylibre.com>
uid                      Kevin Hilman <khilman@gmail.com>

___________________________________________________________________________=
____

015  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2020-08-21 [SC]
      536E 227F DA02 2F6C DD0_  _415 4787 0172 0E5D 7C58
uid                      Konrad Dybcio <konradybcio@gmail.com>
uid                      Konrad Dybcio <konrad.dybcio@linaro.org>
uid                      Konrad Dybcio <konradybcio@kernel.org>

___________________________________________________________________________=
____

016  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2014-10-09 [C]
      9423 1B98 0100 EC61 9AC_  _E10 F045 C2B9 6991 256E
uid                      Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>

___________________________________________________________________________=
____

017  [ ] Fingerprint OK        [ ] ID OK
pub   rsa2048 2017-06-13 [SC]
      F47B 9A62 76E6 0E1A BF5_  _0C8 256A EA18 47BD 5684
uid                      Miquel RAYNAL <mraynal@kernel.org>
uid                      Miquel RAYNAL <miquel.raynal@bootlin.com>
uid                      Miquel RAYNAL <miquel@bootlin.com>
uid                      Miquel RAYNAL <raynal.miquel@gmail.com>

___________________________________________________________________________=
____

018  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2019-03-18 [SC]
      AE5D 7188 6C73 A299 FB8_  _6F3 BFDC 09C1 F24D FA45
uid                      Miquel RAYNAL <miquel.raynal@bootlin.com>

___________________________________________________________________________=
____

019  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2014-11-10 [SC] [expires: 2027-03-09]
      18ED 52DB E34F 860E E9F_  _82B 7D97 0932 55A0 CE7F
uid                      Nicolas Schier <nicolas@fjasle.eu>
uid                      Nicolas Schier <nicolas.schier@linux.dev>
uid                      Nicolas Schier <nicolas.schier@yahoo.no>
uid                      Nicolas Schier <nsc@kernel.org>

___________________________________________________________________________=
____

020  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2011-09-29 [SC]
      BF73 94DF F6F2 31A0 342_  _589 7647 E1A4 4BC0 E4BA
uid                      Peter Zijlstra <peterz@infradead.org>

___________________________________________________________________________=
____

021  [ ] Fingerprint OK        [ ] ID OK
pub   ed25519 2026-07-28 [SC]
      9BE0 4FAA A235 EFE7 CDE_  _22F AC2F A78C 94A9 17EC
uid                      Rafael J. Wysocki (Other) <rjw@rjwysocki.net>
uid                      Rafael J. Wysocki (Linux Kernel) <rafael@kernel.or=
g>
uid                      Rafael J. Wysocki (Personal) <rjwysocki@gmail.com>

___________________________________________________________________________=
____

022  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2010-10-11 [SC]
      EF66 0D07 463F 8B72 6A7_  _413 D8EE D7F3 C83B FA9A
uid                      Sebastian Reichel <sre@ring0.de>
uid                      Sebastian Reichel (xmpp) <sre@xmpp.ring0.de>
uid                      Sebastian Reichel <elektranox@gmail.com>
uid                      Sebastian Reichel <sebastian.reichel@collabora.com>
uid                      Sebastian Reichel <sre@debian.org>
uid                      Sebastian Reichel <sre@kernel.org>
uid                      Sebastian Reichel <sre@mainframe.io>

___________________________________________________________________________=
____

023  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2024-11-19 [C] [expires: 2026-11-19]
      A3A9 D4BD AB10 6981 1F4_  _30E B0D5 89D4 6708 EC99
uid                      Trevor Gamblin <tgamblin@baylibre.com>
uid                      Trevor Gamblin <tgamblin@ecocode.ca>
uid                      Trevor Gamblin <tvgamblin@gmail.com>

___________________________________________________________________________=
____

024  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2010-06-15 [SC] [expires: 2027-06-21]
      0D25 11F3 22BF AB1C 1580  266B E2DC DD91 3266 9BD6
uid                      Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
uid                      Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.co=
m>
uid                      Uwe Kleine-K=C3=B6nig <ukleinek@debian.org>
uid                      Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
uid                      Uwe Kleine-K=C3=B6nig <ukleinek@lug-freiburg.de>
uid                      Uwe Kleine-K=C3=B6nig <ukleinek@strlen.de>
uid                      Uwe Kleine-K=C3=B6nig <uwe@kleine-k=C3=B6nig.de>

___________________________________________________________________________=
____

025  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2015-12-01 [SC] [expires: 2030-03-04]
      A940 D434 992C 2E8E 991_  _D50 224F A7E7 CC82 A664
uid                      Vlastimil Babka <vbabka@suse.com>
uid                      Vlastimil Babka <vbabka@kernel.org>
uid                      Vlastimil Babka <vbabka@suse.cz>

___________________________________________________________________________=
____

026  [ ] Fingerprint OK        [ ] ID OK
pub   rsa4096 2026-09-03 [C]
      2582 F5D6 BC86 8798 0F3_  _CF1 FEAF 321A 8F08 C9B3
uid                      Waqar Hameed <whame@whame.dev>
uid                      Waqar Hameed <waqar.hameed@axis.com>

___________________________________________________________________________=
____

--tw6ljmcahig6fsg7--

--ftx46fobm3z6npwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq5DQwACgkQj4D7WH0S
/k5AFgf/d5P1SHh+g3y+q0dTadn3ndJmzOyBrsCmjdBcwZRSNwxxJaR9vItk2UDc
+W0wUIDqOg9VPRyuzzxPnHXIwb0LYbVpRI1/NwK5ugj3jou8O05b86ey23weZz9L
5J788/DN5rkxNVUB420AURt4wdtTcsEwukR3b0EQduG5yidrLcuVrHUOMmy8Hy5p
T9OuN50B2rZ452+VPjV0LGc2zsELslsoxnmbzdqxvQIjaAnB9q58BR9dVQdP3t5N
M8HCdaMjlILxztlsuEaDHpSC9z2r55agrLCNLV5K6dFUTDk8eAUHnl1788uSczrY
69653zA7kwUrQNyhr3NNzL+YRnf9Xw==
=HygN
-----END PGP SIGNATURE-----

--ftx46fobm3z6npwj--
