Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126740;
	b=r0NujV3sAiLX3EEkTzrYH1ntlynswHFCybXmOq/qtPcWtHzpid6B/2CtqPwOAE20v9Us
	 zpWJDAmYVyUbhCNYUf3ZVNNblmctlJkua2LSg20w18fctxJW1kfcu0+KRkgN2xg0GBQ8E
	 dlazsMv2p0kdB+RPW9bFTDtDAy/4ZYeiplcB+Wa/5VN7S5vIqdxTxNsljpv19ianuXoW7
	 Tzaimq6nDH6hJ5E292/fg7TH1+S4cN2G43OrP/4zappDnYsC93wsxQSkdZmy7Bno6XaZP
	 TQy0uXd+H/ryAQsHv1uuIJJWrHIqxfovXUmWwus+VRFtI6FPlnLAtwDGvr2Rg5MD5bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126740;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XYx5fIHYinG6+ASlKKCycyZ+xAux0HBR/8E9lJGdg3g=;
	b=JYml8Yre9xrbLjTZWCjiBQdGe1K4Rxp6rb2ZX1mgcAN12rG/IaASav/49eaB+lERcGvY
	 efTXkrWHJdCCAQijejfcKp/+8sjRjN55Oa03fjdGrBQC/eb2U2MPhqUkAbUCW3Xm20q1K
	 FAXRk/H+0xGY4EgEwhctNhx6GdxkTZcMedCv/9CWtXhdjtM2XGOuqgFR77OBGfXyE13MC
	 kKUdaUqBUnIyDcMqBwkJ1effIJQwHYZ6MUrJGJBB9Iu7rtes4jEjEFHbBtkC7qb0XWB2G
	 hHzXxQyi30/w5svEF3sJu+pW6pxT4f+UidYO5IU/U+GXFLPt5s2A48a7k7MkcLfnjNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F421E606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F421E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so1215895e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126738; x=1793731538;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYx5fIHYinG6+ASlKKCycyZ+xAux0HBR/8E9lJGdg3g=;
        b=nFZrX07Mq4CQKseUhMruJ8m/q3FcBwpfObw6Y8aPAqhjcSntyB56HrmIuybWVFX13a
         CnFKzb4db1d5p3Bi3EgroRo50OGOCaxXeBRIPWGrOa5w12DPeAzwCXLNk6PEifEbg5rr
         f03av7ogbpD8KMcEMmZAM8imcCjuE3GOAlsqmk6tgD+3TCe2++XK/O7fGw359t+Ar1do
         7JTgAOoGZMgGEZ2sVLu4grlTfNRddRMpRljKHExHyN3hHcI75aftmUQCGfZaC/jGaUH2
         77Lcc734MeIvujOnhiL4BK1FV292M7OkVdPIqZCJoXGEWLo0Z4c8+DinmALlrWRfPyms
         a1IQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8zJoCU9f5MjwELTnta4Xbmg/PfIPjB8nj14r6XbG63eZSacBqcImPh+A0p/FB3t4Sqhj81/aTBREo7Bw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNtVO/4AP7SWKYBvz/9EleDCauUXDBAvQnOnY6uaBkL5d776qQ
	J+J/Hb/xnY/t7NOE+J9AAtTOfvpk1jtDX/VDMzpPU46pHjCiGIXIoQo=
X-Gm-Gg: AYBFou2K5wBgojh4xS7K7bsOQIgbfRhpb67KfTWDNAS6dqsA7qAHcwSdXQSM+eMzDpG
	CkQsdc8ly0PeuO2Fjs7qh8+3QeJnGBjGaYpPQ1QO19LT2iXMH9V0PjLersRszXuTNdlqNI7s8Aw
	/rjENkn77TpXfnC+5aJgAJp9nhMYBS1kHfHhj/gtsLE6G/PpSTGyo2f7hUTMHUydFVIEx93lAcs
	+1NjtoU+/kn5yLFsmo2hIc6yXMn0cIbg5k3Q1kBeNg7uqoaG4t3VTggRyeG4zw1KVRu0Q8zRKx+
	/C4OrdVlpOtuTofZsvmJ+mWsjue0KCssex2gPc3m3r7FtjPwQNOyvsmmJgji3u1dZ07hrRbJFWv
	0tgVP8CH+CJsfW4+FPljMANcHEsO0NanuTV4onH1DPR81wNSgeaiptPz+QAqVAI1cagEe3trdlg
	QnGny+mJppI2WW0T+nKMpcSNQ1HMEQNu3PpXyLzY8I4X8WW3SjgIZh6RsPPtHi3JzvCoxmEtjnw
	N339WAXYvSr76DKUsybcRZM0UA7F+64b3gsSbFvepp1RuGX1fhl7pv+uzytzgQbcq85Epeuh+Ha
	miYU8xEjmvB6K68sNCVqhlC9lFD67bYJc/ESiUeIWd0N8O9KWLq7UPJ1kNmklg==
X-Received: by 2002:a05:600c:4e4d:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4a35acba70dmr224003675e9.24.1793126738001;
        Tue, 27 Oct 2026 11:45:38 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e1dcd1asm923765e9.7.2026.10.27.11.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:45:37 -0700 (PDT)
Message-ID: <6ae0f151.0f9a9df6.1cace3.5239@mx.google.com>
Date: Tue, 27 Oct 2026 11:45:37 -0700 (PDT)
From: D. Manresa <dmanresa@gmail.com>
To: antoine.pichot@gmail.com, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
 dan.scally@ideasonboard.com, hansg@kernel.org,
 andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: ov7251: fixes and infrared strobe for
 Surface Book 2
In-Reply-To: <20261027132641.540323-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
 <6ae07c62.e52dcaf0.293af3.e647@mx.google.com>
 <20261027132641.540323-1-antoine.pichot@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

On Tue, Oct 27, 2026 at 10:26:41PM +0900, Antoine Pichot wrote:
> On the Book 2 the firmware reports 0 but the picture comes out turned by
> 90 degrees, which 7/7 corrects for that model. Could you please check
> whether the frames are upright on the Pro 7+ and, if not, tell me which
> way they turn?

They are not upright here either, and they turn the same amount: the
Pro 7+ delivers the scene rotated 90 degrees clockwise. To display it
upright you rotate the frame 90 degrees counter-clockwise, that is
270 degrees clockwise.

Two independent cues, because I did not want to rely on how I held a
test object:

- the ceiling lamp of the room. In a frame from the colour front camera,
  which is upright, it is at the top centre. In the IR frame taken at the
  same moment it is at the right edge, vertically centred. A ceiling lamp
  is up by definition, so "up" leaves at the right-hand edge;
- an open hand held in front of the camera with the fingers pointing at
  the ceiling. The fingers come out pointing at the right-hand edge of
  the IR frame and the thumb towards the bottom.

Both say the same: up maps to right, which is a 90 degree clockwise
rotation of the scene.

Conditions, so you can tell whether it is comparable with the Book 2:

- measured on the capture node fed straight from the IPU6 ISYS, Y10
  640x480, with the userspace bridge only shifting the 10-bit samples
  down to 8 bits. It does not transpose, flip or rotate anything, and I
  checked that before trusting the frames;
- HORIZONTAL_FLIP and VERTICAL_FLIP both read 0 on the sensor;
- this particular capture ran on the out-of-tree Surface driver, which is
  what is installed here, not on your series. When I had your 4/7
  applied, camera_orientation read Front and camera_sensor_rotation read
  0, so this machine has the same disagreement between firmware and
  reality that you describe: _PLD says 0, the picture says 90.

If the Book 2 also comes out "up at the right edge", then the Pro 7+ can
carry 7/7 as well and I will test it here. If it turns the other way, the
two SKUs need different values and mine is the clockwise one. Either way
the DMI match for this machine is

  sys_vendor        Microsoft Corporation
  product_name      Surface Pro 7+

with the DMI product SKU reading Surface_Pro_7+_1960, against the
Surface_Book_1832 in your 7/7.

D. Manresa

(Written with AI assistance, directed and reviewed by me.)
