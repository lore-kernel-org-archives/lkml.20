Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605521;
	b=dglwOpcCyFj3S9yScv7JKVrBmGFzJMb+soCj4aVVBsB4szXN2/mYU1sf0lOXB6/krjgi
	 8Hz5dY9MQepKGuWYihrLX/Lpk50r/8UR0uLqyHQ6PJEygobwy/A8v0CGmAx+snHvkzI+l
	 hewYGO0+0rr3t9yWa94z4gapyuV6w6asbeXbZYMVh9QF/rwmQJJthuEK7PDO9hU2NCY68
	 x7h1EQAFfsVFVsQbWPmBFR/OD2PQ96s+LNLcEiSrYMjaahwlfxmtgNjnPzfQh6JKr0rsP
	 3O7d1TwHxIuOUthZoAZKWoz4kumSDHhO3rC7IP/QffDbT9YvOdfPpO8NNE3DkMdVR9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ha1K352wfyqdFbF8DNVmHU8vhoz9syKvY98S4jY+g6Y=;
	b=F9E/7tHoIY+RygFY+xJvfNM33kE5UtA//sP8NrBwBrUfSvUz2S6oY9wE7PsM7yH/niN+
	 4MLuVoEleFBM7r0eqPW99HMHboD64y3hD/Z3oR62B04GJ4NusCBE+fdXZnHIkgIoDKMEF
	 yNddSZnfWc1HC96WM7EPbgF9aoOJJ9dMd3uAoFJhj0s/8sG1iMZEW5GtAUyJbt7uZ4EpZ
	 jQ2C51x2RQF2wnJLtmieTbgg/ok7R73iOgrTqHY+PO24TsBHOBflRFegFhhZgdI+Zmc6F
	 hbzjBnhiKJ2B0HIuh58kGztMsA3fqyxREZrQlZ9sjjHBoO5ieCwsRAMSl3Sc7P9i+9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FT4pwh6g;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCA1606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCA1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FT4pwh6g
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so660109241.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605519; x=1793210319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ha1K352wfyqdFbF8DNVmHU8vhoz9syKvY98S4jY+g6Y=;
        b=FT4pwh6gpGaIQ6svkDMoqALbka3hBJJwgkHvkiaYv/qNWOGa5DhCoyrhMuH9rgTIJx
         baThPsKkl3f9EaTmvHlonm7bADrrg1Bu3W2cbchx1i9d3oEFPmfwzJxAPDW0ND4ZB3I+
         8DQuQNXHSbB90S/57d7YMWMBAN+tY/0o4x8VIb8yR321706XWUmk8ZQkkApNsaZO8Mxe
         DnMdp053VU2HdjfXWOS8Z1gwoLWH4Z4FVQa+9M1+llC5mYY87rbhsSNrgmcDyFPxLoeC
         +rAxusdHJf0kJ6URDKVvZa/j2/fs3AatLn7za+iZP/Pr5A66JlTmX+NV8duUTeOHKxkG
         a5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605519; x=1793210319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ha1K352wfyqdFbF8DNVmHU8vhoz9syKvY98S4jY+g6Y=;
        b=hqv4qlIzWrOEM4KrQJWF6YvXlwvG/QGrM0GEbsZebZm7TNVP0zBDpim/J1YOl4MobS
         qLecSDJiEfTsPrSC20eBl8BbWZ2BdSGS/vIf/QfD08TCag1RSnBuMpr6DLzqlU58ucXN
         DSe1QF4lKW38U1MA3ZDpG57EAuOifnsZKlb8JT3pKj/70hqRN3+L4L27j43Z5QHciVN7
         pcZDvuK6N3lIUuD4AlotoBgGBlTbcFMpAgHkr6vvsUWTNBVmTyunbuyVz50lvufbGBip
         YdIIkuSaXw5es+vmS3cznhARCCGilD0iEgib1ja0IxOAjZpW/rqF3rIyVQirnFR14WgY
         ltDA==
X-Forwarded-Encrypted: i=1; AKwUvBySaxMNXi6hGFr9JWgY8E9eZpxbIwdHX88+sU/6X2aYRCtTf1eSv781JV4wKdWMmmKGqhp2HwZbjk5SlaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRWQktcJPxEeE85phUhBDlKq7Sh6pWsuchM9n3up0JMhzueIHX
	mMtMTEI8950g0lkvU3ZuV+LWGEMkxvZWzGIH18kzYNPS0Lvy1RYm8JT+
X-Gm-Gg: AYBFou20ga/RfrOj/mNkD0lwyC0akjh9jyupjYzsMwkmx468DcP06c8nnb3Yn5yNVwB
	2nw5aLP2b5WBUwmXDzQg1UmV5UmiTVuTr3o+MldodEjmDg4uJE1ZlQU8/gYyQzS70CEW16MLnS1
	HILMrH7jblTITxdbDULL0Yoag8JUCBIOF5Ke5rWPgm0/8UEMKLMIzh/ikOa2DuS+u8SurjV+/ZR
	ZdBsrXJdCB/gF5KhclGxBNqcgkj291eWhioM8Zh6Gj9ExCmhnIQnJgqptEyf3LTK7/wm1cGQomz
	kzjchlvYGCLVE64JIPIrr4XnVtcGIwW6dk1RnD59vQ/aAvna9V7+Jm1RpbShGiKCJ1JLeb2N8Oo
	QbsWt12Pizhgh1/sEHqlRr+DyZl5Asa2S5+xdZcP2kZ9a0IB0t/EmAD/y408ak52f7QS199LTPQ
	cUslBNFnBiubiFtZmYeJyFpR5ZOBBiXuQG4V8Vb6X9S3Y5Yr3CvVayCFXMd+qJJjRILQ2yCWIJI
	F60HC+uWm34bMoi2opKfK+dZo9AQSrqru7YPMl11RGx2T3mQ4dxPXpExQeIwRyLdp/6Xm0vp0SK
	cA3aCTnAmnI0R22xiFvPd9S4POGX8pXVibUuwg+3kTUtyKam+lG7EegPwgNvPkX9IZoEWvW5VGN
	oxZBHMQkcPA==
X-Received: by 2002:a05:6102:508f:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7cc9271966dmr1231907137.25.1792605519613;
        Wed, 21 Oct 2026 10:58:39 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae9788c68sm4090944e0c.5.2026.10.21.10.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:58:39 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	ilpo.jarvinen@linux.intel.com,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
Date: Wed, 21 Oct 2026 14:58:22 -0300
Message-ID: <20261021175822.318717-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <414bbb7a-1018-41ac-a580-cd41708c6a78@arm.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <414bbb7a-1018-41ac-a580-cd41708c6a78@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

On Wed, 21 Oct 2026, Andre Przywara wrote:

> So if I understand correctly, this compatible is really there for the
> clock gating issue, right? As the DLF part is now somewhat correctly
> auto-detected?

Yes, the compatible is only for the clock issue (SKIP_SET_RATE). The
false DLF detection is handled generically by patch 2.

> Can you share what your termios test looks like? Because I assume this
> affects more Allwinner SoCs (the DLF change definitely does).
> Then we should add more compatible strings here. If there is a simple
> test, I am happy to run this on a bunch of boards, to give you a list.

I reduced the termios test to a small standalone reproducer and retested
it on the A733. While the serial console is continuously transmitting,
this program toggles CLOCAL and restores it:

    #include <fcntl.h>
    #include <stdio.h>
    #include <termios.h>
    #include <unistd.h>

    int main(int argc, char **argv)
    {
            const char *dev = argc > 1 ? argv[1] : "/dev/console";
            struct termios orig, changed;
            int fd = open(dev, O_RDWR | O_NOCTTY | O_NONBLOCK);

            if (fd < 0 || tcgetattr(fd, &orig)) {
                    perror(dev);
                    return 1;
            }

            changed = orig;
            changed.c_cflag ^= CLOCAL;

            if (tcsetattr(fd, TCSANOW, &changed) ||
                tcsetattr(fd, TCSANOW, &orig)) {
                    perror("tcsetattr");
                    return 1;
            }

            return 0;
    }

I compile it with:

    cc -O2 -o clocal-toggle clocal-toggle.c

and run 300 iterations from a shell on the serial console, keeping the
console busy:

    dmesg -n 1
    (while :; do seq 1 1000; done) &
    gen=$!
    i=0
    while [ "$i" -lt 300 ]; do
            ./clocal-toggle || break
            i=$((i + 1))
    done
    kill $gen

CLOCAL doesn't change the framing, so the output should stay a clean
1..1000 sequence. A bad run shows garbage characters and missing lines.

On the A733 I ran this test five times without SKIP_SET_RATE and all
five runs were corrupted. With the A733 compatible selecting
SKIP_SET_RATE, all five were clean.

Running the same test on your other Allwinner boards would be very
useful. I also have a small script that checks the capture, if that
helps.

Thanks,
Vinicius
