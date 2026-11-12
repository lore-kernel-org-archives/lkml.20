Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498577;
	b=MZ5sJa0U32l9z1IUdVNOa5KbJ86fll/d2rtSrEKzLiE4vvWZcEI6RKKio1gT4kGBdpl3
	 kticnw7+CuNYNI0LQJwDe0hyjiJ8SVqayLyJdv93rYu7xPugZI4RPGWiWzj5i32XAHi9w
	 3R+OEuUfKWJ+PiPQxJ6V6DIEz6q6bHnjaL1PPkmfJDhzsaJLlBGxVkqVNCxPJ5se+0UdK
	 kjvoxEVuliFqxTlZSgx45O/SEj0s6tMyr4IDQq7fMfuRfO13g1c/R92KEhHzYgH2pDzPI
	 OYPil3rTcVKLVuLEeFEd3i0St83AAAf/8HYIayLSKYRFeslSw7Hu6mZdn7dqJfWDx3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PGUpMcemVyfBVbieZwrWHkk4i4jDJi9m3gXexw58z8w=;
	b=mnKc5IEMNzzE5Y0qJ5p6VYAl8MsqE/pyVATTjUI3SsipjTKXKDokesbQ8+/8vXCdg1OS
	 3Dy849AM9eJzErWcQP+UuYW7XEwVRiB+sWENdc2SpX3g3F0izKkJHklCH55wK4YC67ajV
	 bHEunByb9qi2Jk87H5hqV4sF08ubt5pEP2vawXSZAYUMDSodcQ7lKcpyQWRg48d6iJPC5
	 wocceyvjmrWaKYhyjuqhfeyLX1LiZ2UZDYaJOK5P0SqvP0kG3VhKBCFz3g6qXGi4jh4xP
	 s7JhHwf1Mq0rJvoyUTLNWEZsJ8jjErqbAZtvUBtiGKGZ3V/y3ereFnrIj9uM4OxF59A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhmyH61Y;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02AE606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D02AE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhmyH61Y
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so6660435e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498575; x=1795103375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGUpMcemVyfBVbieZwrWHkk4i4jDJi9m3gXexw58z8w=;
        b=IhmyH61YqPxxP+Jyh6e//WkXhC6o63g3GEwuKoAobT++FxmiI0F2gJtl41dywOIgiW
         LO2T3CZWrHXExQ3cG1hy6ARpW4zfLKN6Zl7ym75TdEOTYK5kTayy57eVOckdnnQQ7oTN
         98QatQrx4V9qNBcINPfliqVsO3zFCYDefPUVdg4rSL7Er+X4uSKq3thngrGl8NWs26i9
         8ILq4cIb3YrJn9eCALkPtjZVE5sGtRVqwBSFBMBSHnEh8kJZ42MkAI8V1WAIKZ3CjUdW
         JGdoy9bvl4iWa7tXHAWXomrFCw8ZJR2Yx+7zdRTzBc4KoMj7bJE09K2B928rP/OlAQSQ
         FMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498575; x=1795103375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGUpMcemVyfBVbieZwrWHkk4i4jDJi9m3gXexw58z8w=;
        b=j8uYZy5C1uEJFbfCpwcVzQAlaDTjciNOi7RsnUvs9cKV3KwO6biETbMrivIdfERgC+
         lhUrxgw+NqShS5XOBoU6hAxURayFqfq1WxhUxqXhzk78/6auXTICv2zGB17rgvtCKf84
         n8qG2/giULvo+ypTXaQmxgzLgk4G4kxx/Ym6eU+opfxwWP5LMjW9nrm/KFXl+UlP5J7l
         EOpD//SGs4X8+A1sQ5KwbCtGXCJr1DgjZX6TKEeeimwYxpYaMHDhhhjt75712lTC8Dly
         UqSNFn8+Iyw9w43cpYxmpkPb2RfyCU70fi2yRqRuEcp4aTAeInuTIxCPOCLZJx5mD0kO
         2b9A==
X-Forwarded-Encrypted: i=1; AL+hErEIc0D3LZDX3p8fEFViN5R5pZuBZxqe+pe1Ql476k9YT5whzpSGS9VEdq/OydTuRY8hzcK9XYBO9sQxkoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qMGPOTgHOOboWD8f4vgbvdwXQT8JYSv+ttp5BEEeX/refvh1l
	5wv5DCBw5wxIB8vfQuw5QcrtTUUjkoAL8EUwbS8+IvSKcbnkfk7VbmSZ
X-Gm-Gg: AYBFou2kEn7wTPkiTeA53dJ5whd9QsEWABxKFlOZr+X9swRI9VdNOXE+nm/EP46K51s
	VsAOih8Mv20vidESyofL88XcZ1Dk5gKcA61cI6Pm+shUBHxc9EpbZKHwxqvDHKKle/Xh+45y2Z/
	X6EA90s23ryyRelWz4mQy5Js4PtCarQuGg6mf04oWqNGfRHjm4WF8+yyLi4uJeiCorBTPFIfvop
	xaDqP5hSOL9og53JPbgYqUw4dgWbvdb2IghMvdCwFMW/SL9Rp9DaJS8C7GnnETZ/4RBhGjlhUwc
	yr7/RQtjsKgOUr0+/X+DN8bK75xJtpZLzykIj4t/GgPh9G4NT/UPHTp9s8rI73H7gEoG95FXylQ
	HGo1AHfmMPkVBQTe5YpQXTlmwE4ZrC3YQfcekUxMhSECOR6Z7TY5tlQ/mJRbfM/9YrG1HxCNwef
	BatGP2JbsT0Xvwglvww3qrYIxaTbCtISNXsVf9z1sElrxjpNWzJTG4dXYn0F1RG3MxGGaft5p7T
	NZfXivKf7yrLZ2O/VFyrhRaJsustxizRxvGhIlFX0hrA2hxUK1MXnlPGQxMQhvknE87mF+cTaRk
	Dz+onP0530dKjhjyaVSeCqGFH12Z9jqfbLpoG7znHdeLeEBTVUWHEU9H27acRZR6AiGPotn71hY
	=
X-Received: by 2002:a05:600c:6219:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb4e27995amr53713365e9.5.1794498575107;
        Thu, 12 Nov 2026 07:49:35 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm139337155e9.1.2026.11.12.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:49:34 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Francesco Valla <francesco@valla.it>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] virtio_ring: reject a split ring size that is not a power of two again
Date: Thu, 12 Nov 2026 16:49:15 +0100
Message-ID: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The split ring indexes its rings with num - 1 as a mask, so its size
must be a power of two. vring_new_virtqueue() lost that check in v4.6,
with commit 2a2d1382fe9d ("virtio: Add improved queue allocation API"),
and remoteproc passes it a ring size taken from firmware. A firmware
that asks for, e.g. 100 entries gets a ring on which the driver and
the device disagree on where the buffers are, so the device can read
the wrong ones. The only thing remoteproc checks is that ring size
and alignment are not zero. The other caller, mlxbf-tmfifo, uses a
hardcoded size of 1024, so it is not affected unless that value is
changed.

Patch 1 puts the check back; patch 2 adds a vringh_test case for it.

Tested in userspace with tools/virtio only, not on remoteproc hardware.

Changes in v2:
- Patch 1: log with dev_err() rather than dev_warn(), and say in the
  message why the length is bad (Francesco)
- Patch 2: commit message updated for the new message text

v1: https://lore.kernel.org/r/20261111172947.3579982-1-stjepan.poljak@gmail.com

Stjepan Poljak (2):
  virtio_ring: reject a split ring size that is not a power of two again
  tools/virtio: vringh_test: check that a split ring must be a power of
    two

 drivers/virtio/virtio_ring.c |  7 +++++++
 tools/virtio/vringh_test.c   | 11 +++++++++++
 2 files changed, 18 insertions(+)


base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
-- 
2.53.0

