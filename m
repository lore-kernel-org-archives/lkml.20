Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450936;
	b=E76LA8Y6mvsymkDBz2OMxijWcQecGkZz4iJd1rqJVEJivVG8qdAA5rB95/QlKoyJsYA4
	 9kd6MDwvEtd5lM7cXaYOkyD8zzgOBllA82N19ywgt13AKUDX9JzIz/JouztqXEtUDKFPq
	 MUfHnOf2FETrpa+ZVINOzOLqcagiG5wqhf7IAzsIKTDv+HWa995jh2qGCrxbimmYkuiJW
	 OGG5Iuv1sgUPVImOGa+L+RUNlOxxF8ImTC9Dfh7xuhmdnG6i8U5LDtCn8LxZ2vfLpt9Yc
	 eiA4HYc9oqy21VVdaG8K5EeGJ0Bmp/6+Gwz2TaZV59vnfXlak01Hyc1+tECdMh4O+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ATl0o5hKkBtNJGh5uNJqlcxf+TKL5xfzOgAFm6I60fw=;
	b=2we8mvlJLgz3jGYZ5ReCeEmSOMshYLUland3eexGkf8HOawSoakoV4RWxtm1fq7WRljQ
	 4frt3GaVC/cNxg2l+Y6pg9egtXbSo6J476o9q6BwyjlINPfkLpzkUS6LBpCwjs+gCrW4X
	 58Wh12rwwp6zjacelNLCi2XIOmV9bBjTnnXXt4HzhEa1KFBucOhW7Nu3D2mn3mwUFEuMW
	 zhhRKkFZfpK3MsXc3y5avWCgiuP1/JMRRSCMNZo8As1eEFN94xZb1EuCYjqMS29o9tOY8
	 6R3WxJlLj0u6vcJUskje/fyhfVQHaxa1l4LlpQZ760/22W670NGlfqV0Y3KkdShDerg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tNARRPQ4;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE1A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tNARRPQ4
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6cf995766a3so2252986eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450934; x=1793055734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATl0o5hKkBtNJGh5uNJqlcxf+TKL5xfzOgAFm6I60fw=;
        b=tNARRPQ4mNM/vLD64uL7mKOijZn6uJPyTry8njNLN/aMfCKF9duv80uwR0CqyqcpMl
         Sf1PBYOkqYFsXUka8lW2er3VsnvnDKvxJf2IAU9Zv3pklKyVWRYZMW1b7QmSoNCAhhsV
         fLPN+nCuYFDwNVUppnatR5/yXW9VBaaeuT4Ftm5IBy5wCwf+/Ts4X2lMInTIIphQHo/O
         KNIsFCuC354G/IP0JBWoRstFxm7Khf1YF5YlVs3krQUJcU72ZAvVuVCEcOMM1/Xmc1DB
         o4FkTq0FYbqnQ+KF9R5LdWwUwV/xWCRD0pxH534JKMGJnkia1pV3Q91H7pnTk5B/19X6
         RZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450934; x=1793055734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATl0o5hKkBtNJGh5uNJqlcxf+TKL5xfzOgAFm6I60fw=;
        b=bnrvmRGs2D8riO+Q3kQW+hSJt3GD3J/BAyvGm9jggoN6iXiNN8qreKbiQ4DepoBLCq
         JKZBhReGnsymyH3NDvxWoFD24jtISs0vusXOS1SOrvCDHa5vWe7XxbbdyXD14076LGLH
         0ItipItKn9VCdr7gJ/h0MzSIBgs7fnymIrgFdKw97GWBTw/JJGg0okdmPuJgd6XEa8II
         FFMfXqYQk8k6nR/q4jR4Gvy1wSW8LWMvxIZJCbe/t54iIkRyFtoU3a94TSt8ABpYORC3
         J9eh27hfbao+Z+ro7GpXUBaOsGzPm6yhdXgBCtnglLut06SuXqUy3SNyhJFu3WnuTZnr
         9rDw==
X-Forwarded-Encrypted: i=1; AKwUvBzaA5TrM9wgKSUvz+a2bizUfyU1nDEIMIlj0Z4WzbmvnA9ciRDA+jJH3aufD9rrjCzZtP7xHHp02yveEgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8qIdaKKabFKoPRdGdlRCVgv1/j4t6lvTCak+ymRVTRruvLh+c
	dXDhT/TsiHYPy9tCDdS/u+corlyB7B5Rzl8G7XvKqcjTSmbGgf3NJhA5
X-Gm-Gg: AYBFou2yXXhVldifJzuS6hx5RkqJ1ol/9owSAXFr96CrgaynFPP/I8D7ZHrGO5B9DBw
	WeI/nz4kuOzbQXAs5V1m2p31S3pMWz6SpJsnzTb+lGIbMhKts6zNK5MnNJPFtxvWaVLUnZIgDHM
	S+PPTOU9+NVJEkdB+bBXdNIJZ1rKIeQ+ndB3DB6Hmmsax+pg0asHbSseJbOxtJwJAMrUTV7lSCt
	XaCYHx9VrlGc1BVuRmAy/E1Ny0aC7J3RcNGuIRWxzS53mFUJNwsH12FXFM7Ae4nvCtJjkEJdKet
	pC9yWTOrE1a98QepBoJ2puxE+PNeJBsl8zf5JbKilM83l2ex/8/rNMhI9mGTmuPI6XbOYukstA+
	/1xHSGr7iF4qdkDW/a2ubFuaNKuehKI1U7C3Na30lrc43NCACZ6pFbv/K5ZrredOy1nwqo4SK30
	373MQrY+a4gSzxTM6v7sPQg8+1Lv6LXZVGNp3/Ss5h/imJHBZKkjjvgII04ZyJ3WNkuVnah3zva
	fCX0KD8ZzFSzDi/szbhmqjJNA==
X-Received: by 2002:a05:6820:1694:b0:703:34cb:a3bd with SMTP id 006d021491bc7-7035287bda1mr6580369eaf.4.1792450934312;
        Mon, 19 Oct 2026 16:02:14 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm9327797fac.12.2026.10.19.16.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:02:12 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
Date: Mon, 19 Oct 2026 18:01:54 -0500
Message-ID: <20261019230159.834954-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The Audient iD14 MkI (2708:0002) keeps its monitor section, output
routing, mixer and input options on vendor extension units. It also
uses feature units whose descriptors declare no controls. On Linux a
user cannot change the routing. The device powers up with every output
on DAW Thru, which bypasses the volume knob.

This series adds those controls in a new mixer_audient_id.c, one group
per patch. A MkI-only name map hides the generic controls that each
group replaces. The MkII keeps audient_id14_map.

Scope: only the iD14 MkI is supported, and only its USB ID reaches the
new code. Other Audient iD models keep the generic driver. Their units
may differ, and this series does not cover them. The file follows
mixer_scarlett2.c, which began with one model and added others through
per-model tables. Names with id14_ hold the MkI's unit IDs and tables. A
later iD model can add its own tables to this file.

sound for-next also has mixer_evo.c for the Audient EVO 4 (2708:0006).
EVO and iD are separate Audient product lines. The iD14 MkI uses other
units and a larger control set: a monitor controller, output routing, a
14 x 4 mixer and write-only controls. So this series keeps the iD line
in its own file.

At probe the driver writes only controls that it cannot read back: the
write-only controls (patch 4) and FU 12 (patch 5). They get the launch
values of Audient's iD application. If a probe write fails, the control
shows the fallback value that those patches describe. The driver does
not write the routing or the mix. User space (alsactl, an application)
sets the rest of the iD application's launch state.

There is no resume code. Every write to a write-only control reaches
the device, so alsactl restore also repairs a device that was reset.
The state across a suspend depends on the power source:
- On USB bus power, a system suspend re-enumerates the device.
- With its mains adapter connected, the device keeps its state across a
  system suspend. This is also true when the host controller resets the
  device and the card stays. The sampled readable controls did not
  change.
- A runtime suspend left the readable controls unchanged on both power
  sources, with no reset logged. A runtime suspend is possible only
  after usbhid releases the HID interface.

Patch 5 replaces the generic "Monitor Mix Playback Volume" (FU 12) with
one of the same name, count and range. FU 12 GET CUR returns stale data
from other units. Its Main L channel ignores writes, but Main R applies
them. audient_id14_map already notes this asymmetry. The new control
holds Main at 0 dB. This is a deliberate change for existing users: a
Main R attenuation set through the generic control no longer applies.

The protocol comes from Audient's iD application (version 4.4.5 for
macOS). USB captures of the application confirmed it.

Test setup:
- iD14 MkI, firmware 1.1.1
- Bazzite 44, kernel 7.2.9-ogc3.1.fc44
- snd-usb-audio built out of tree from the v7.2.9 sound/usb sources
  with this series applied

Tests:
- listening tests: routing, dim, talkback, Cue
- a loopback cable: gain boost, polarity, FU 12 per channel
- alsactl store and restore across a replug
- an out-of-list routing value
- a runtime suspend
- three system suspends (S3) with control reads running at about 3000
  per second: no read failed after a resume
- the optical power-on mode, read on macOS 27.0.1 with no Audient
  software running

The series is based on sound for-next a4ef328ce3b3. Each patch builds
on its own there with make W=1 sound/usb/. The hardware tests used the
complete series on 7.2.9 sources, where snd_usb_mixer_add_list() has no
look_for_empty argument. The series passes true, which keeps that
behaviour.

Will Porter (5):
  ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
  ALSA: usb-audio: Add Audient iD14 MkI monitor and routing controls
  ALSA: usb-audio: Add Audient iD14 MkI mixer matrix
  ALSA: usb-audio: Add Audient iD14 MkI write-only controls
  ALSA: usb-audio: Replace the Audient iD14 MkI FU 12 control

 sound/usb/Makefile           |   1 +
 sound/usb/mixer_audient_id.c | 790 +++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient_id.h |   7 +
 sound/usb/mixer_maps.c       |  10 +-
 sound/usb/mixer_quirks.c     |   4 +
 5 files changed, 811 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/mixer_audient_id.c
 create mode 100644 sound/usb/mixer_audient_id.h


base-commit: a4ef328ce3b3ab1bf63c6350e890f13b9b25e3f1
-- 
2.47.3

