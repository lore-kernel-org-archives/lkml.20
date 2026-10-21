Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541699;
	b=w//LyV3FxXtEBHKUeTZG2kU6JCd0qQB8ZNk8vh6OvKr78tzPAO/P/GWSSiWECzlv5zLd
	 QZs97a37fZRuvO/JW+YSJkBx169ReitAXw1tNihhHJxFwL3vTEmYQdLoX1obHwtZHrBN4
	 xAtinueTs4a9Wm3+LEwEi0g93y+N0AO2nLn2SmAnPfymDC59SairR5WgbfWqpoU79vND+
	 pPj28Hg/WDXUqUP0bBrgYDOICmdsI8I4Rfj9hKLQ9oMOcKzTl34FLAfXr5j3yy3Mvwr+O
	 674nqTobaTwIeGi/6TKe/koKaUaAgs3P7HEltheEaOenKGG0INeYC/HsXXNK2bsd2qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M1cEjrlJw0MSkHcvb3QCv5p5w10q47ufAh5GdxhFpGU=;
	b=NdV/0Hn1Z2RZn1CjotxhA7482CephllQCcbY0tpf/yrN5oInx49CJC/Kjvam1IZQAzsS
	 RTxGt0MQc2YmYDW6eoSEWnWLvVBa6CrK4haTOmLmAFHR8+e/TtFNJD62vAx7aG6SJJt5n
	 B3/Nb/tPPgQ5nFv4bJp3zzFVmHrz10jDcacFJS4JgqOdoFDPSJzdFESJcnVzu2okPm503
	 269Bnv4BkZOCt/n8gYGjTeJ/hxNX9lWDjBIB2lafNlYT1YPziLp5GasiDLlDAnT+paAqk
	 Wrf2Sx9i2IGlYRazXWm2W+t6dRxervBTb6c1fEquzg9nVBg8lKLqm5bIOHs0Xs0gACg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="k8Ikil/5";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09391606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09391606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=k8Ikil/5
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso261807eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1792541698; x=1793146498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1cEjrlJw0MSkHcvb3QCv5p5w10q47ufAh5GdxhFpGU=;
        b=k8Ikil/5Jgb7VKMQ+rAg/QxB/rGMhUZoWgWh3gDVeP5Aj/L6hkSSibKuYsjwP/sNrB
         MljdvecICUMjVmSMpFV28sVTFLVS61m491NmhmXs6TzQiH5rAlgzatXyGo8Aggsd/Yk4
         jWjkWSG2iJvVagRd2Lileq4SbnMtPHQwAw4vz0DVV0LNFvuWoVerNSmLHcv5k8azGogx
         YOuS158BJvbVTFq/iRzLTFeWYp5vSVXVKKLZQlQr0mh1HNQPH0j2QNA3U7iRpvKmE6tu
         4E7R/sqalKkOnyALacE6Szz1fV1r7ddnFAkOT175B/0IpQXG70pUtuLQwHvszdRamSG7
         AsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541698; x=1793146498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1cEjrlJw0MSkHcvb3QCv5p5w10q47ufAh5GdxhFpGU=;
        b=DdY0K9k3I8tynl5CgMDNCN/WHFtgqEU+L8gMc8QKiJB0iL0ulxzw2YdjbNqPDe4oK2
         Yoss/lmQEfjxsc8vNLkThh+1PGQA1ziyrkhsuLmz3oV/GpeZ/o6/03ISyikcMl4lAf0H
         AdznVjzhGIJXXS4H1UwyErZf8hrbKCNJkTZaEzTbjJWlTVZFRXewcWWKIsMBbcRTKDKQ
         b6J6j/CLQaHEmarEIwN0aI46Q6gGwp9FBgCInOdgFIu0ea34V1vAB6O46aBQbAsKUdfm
         jMR0fenwniOE5dvE12NnaYOVWNtPiSDIdm3DFW4bw9xi7NuUIi2rY9tuX7VQW63cZ3Hp
         Nz5g==
X-Forwarded-Encrypted: i=1; AKwUvBy9NOJvuBt55d9x7Ej9j1VmvKCbS9WZmsdO7JSMcFDJeVO37ErZrOonmGmM9xl/KIE17CwWZTTQ7eHKp5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsQPL9V+UopdDASt1bmsjNgROi5sMTXef+vkt5DMd4/YKqn9WO
	YXO3uudWpsTm7qAxTkuf/LozP4R7S0zQoVWykFRDePn8m5xNtyP5iV3F97SLIXh5Qw==
X-Gm-Gg: AYBFou0aH+bggIeLzdWaHxWlSEPHJE92HEdnw92sjIL2ZlwVnP1HkdeNIjAPkMORCz1
	9HIRHc06rdpcZpushm/dn3MdR1EOvUfUioZ2yLrYLyn9sF/bkVyrOHc3QnfGIGlddMFkLaDL3l/
	4pOM0KDC+aiVkZY6I0U3fCO+79OOd6bDuZmjJpEJAa0tb8noVyl6wqENNZOflBN/7cjzIUJLV/I
	VdxR7qj1rER4VdNqAww3QfPB8n5f+0k/weCmmJzODVF71r0grZbL6OlKRgmsIa1Zr2D0GOlmUuJ
	HzYLWxSaItX9UXftYH+Xm7UgGzn4OeIvtqhSImn0zbIMmVW0Vc0o3U1BpdwzxyggjCDAj5a4GEJ
	s1FRvIuKphHa+trhvw32PvtS0MTWM5F4Bwa3gtzrjR9Qn6skHixkAL62IfmccQFLCIZOUG0QsCH
	ljyqV0nxkiyUIg0lhnRCJl+cF/Jzi2MGKlSgSbrHy56p/xwcGHEbgQGWoBkMbej7YaiVhUdHf7G
	xpF0RtUQ3bfppShEOV+LTtqJ21EsjVhYAkopJx9hJEtjUB9rt0QUvHLnfkLVSM=
X-Received: by 2002:a05:7022:28f:b0:18d:5988:8d3 with SMTP id a92af1059eb24-190a109f74amr535990c88.3.1792541697865;
        Tue, 20 Oct 2026 17:14:57 -0700 (PDT)
Received: from cantal.lan ([58.136.73.153])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aff3481sm1890657c88.10.2026.10.20.17.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:14:57 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	richardcochran@gmail.com,
	florian.fainelli@broadcom.com,
	opendmb@gmail.com,
	nb@tipi-net.de,
	theo.lebrun@bootlin.com,
	andrew@lunn.ch,
	linux@armlinux.org.uk,
	conor.dooley@microchip.com,
	bcm-kernel-feedback-list@broadcom.com,
	tglx@kernel.org,
	jstultz@google.com,
	sboyd@kernel.org,
	mlichvar@redhat.com,
	olteanv@gmail.com,
	h.feurstein@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/6] net: phy: broadcom: use timestamped MDIO writes in gettimex64
Date: Wed, 21 Oct 2026 07:14:49 +0700
Message-ID: <20261021001449.1306505-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179240607406.3135.6389434535700214639@kernel.org>
References: <20261018100257.566267-5-jjc@jclark.com> <179240607406.3135.6389434535700214639@kernel.org>
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

> [Severity: Medium]
>
> Does the calibration behind this value account for any latency in the
> PHY's external input capture path compared with the GPIO?

[ ... ]

> Suppose the PHY latches the PHC D ns after the true edge and the GPIO
> sees the edge G ns after. Then every interpolated capture time would be
> early by (D - G), and the true bound would be the measured one plus
> (D - G).

[ ... ]

> Is this input latency known or bounded? If not, would a larger margin
> be safer?

Let's suppose there is a delay D of some small number of nanoseconds
between the time the pulse occurs, Tp, and the time of capture, Tc. The
purpose of PTP_SYS_OFFSET_EXTENDED is to allow transfer of time between
the PHC and the system clock. The bounds it provides tell you the
accuracy of that transfer. In the case where the accuracy matters most,
the PHC is being disciplined using timestamps from a GNSS receiver's PPS
signal, which means the PHC time corresponds to Tc not Tp. So I would
argue calculating bounds w.r.t. Tc is the right thing to do, and the
350 ns figure is correct for that.

In any case, D is not practically observable. On the CM4/CM5 there is
only one pin, which can be either an input or an output pin. The packet
timestamps are not calibrated: path delay shows the uncorrected sum of
the ingress and egress latency is around 280 ns, and the only way to
calibrate the split into egress and ingress is to use PPS input or
output.

> [Severity: Medium]
>
> This isn't a bug introduced by this patch, but reg is a u16 that holds
> the int result of bcm_phy_read_exp() in this loop:

[ ... ]

> Can a negative MDIO error look like a completed capture here? -EIO
> truncated to u16 is 0xfffb, and that has INTC_FSYNC (BIT(0)) set.

[ ... ]

> [Severity: Medium]
>
> This is a pre-existing issue, but *ts is never written on the -ETIMEDOUT
> path. bcm_ptp_perout_work() ignores the return value and uses ts anyway:

[ ... ]

> If the INTC_FSYNC poll uses up all 10 iterations, wouldn't uninitialized
> stack data be written to the SYNOUT_TS registers?

I agree that both are bugs, but they are in the existing framesync code
and unrelated to this patch. The patch changes only the trigger write;
the polling loop and the perout path are unchanged, and as the commit
message says, it doesn't try to fix that code's error handling.

James
