Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898472;
	b=u9F5YP5HlDwuTiQ2Jt8UFWWa5kHf2KF4QvIsGJkT2abGDJQs9RiEAK+57jTAfp6/2UCm
	 wjq4omA9m2toCJFsAnUqEaxbrv1MwXl7C6DndkyPkcEnIIGw+svf3Vq4qojfFyNuLmfQY
	 ToL4G8Eyq/CWYYJPxwHFaEIFYZpg5pB0DaLNi3jwZHgs30241MlAo1RMuS9q7/WReoZ6k
	 RJbtJASKU78FmZ1C5G6wWHn0QRuPa++OjFBkUPZN4ozMDQuEr57R9fJpvqVI7Ddm2Ddzd
	 zhgwWceaEQyr84TQDORVGOfEY+ewpuGuEfA5g7MXHpJuxRxHkntgbPCFvbX8slnxsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KRxl9/6qde53Vk7mriBy0p9OdUsOse+58tmRT8HCG6E=;
	b=4fyKFibOriZMVY7t/3BO8H94wRK8Zn+aP4XFRp752jqCLYDDkHcp5Bs2R3NE3ft+GmnY
	 B8zA136nyiUvJk9z2VuG1Dx3Z5QX3dOx2aP+uFIAda5vG1LEukCOWQNwYHxhXi8I73E+/
	 2URkwO/HmkYS7ouNnYiMCgJpGHNUC7leWil33Sm0F7Z4Jip70QgPqzfrWyP9yAdPQcwPD
	 nlrZUSmBOqrb840Jo+iKJY5T9eCBRISjZQPuu++zpHox4T7wEVRmYsaRya7/0D40hHkd/
	 e4nKI+vLnP+fQb0uiBewKRQowKkUeZ+ffTuma3SCvPQfV4I2Pb3/JJRblDPVg7h29qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P2B1NFj7;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9BF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P2B1NFj7
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso3882744f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794898471; x=1795503271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KRxl9/6qde53Vk7mriBy0p9OdUsOse+58tmRT8HCG6E=;
        b=P2B1NFj7KNHU19gS1NmV6YI4nISKC1xWASjZy8+/Tvs00DBVTznQCZ+4AKBy70wrwM
         4O890lLR0brRlPIDPGkAIX1ff4G7KiJ/SL1aShPo2WNIgZbYesMR6S4oX9kT3tqwXQ1+
         eG3g4BqxCOA5xqT+T9/+N5B4EvGiicjmILIn1+LXYhb4MO3qqOTTPXmNJg//7k5jFi5o
         O5G/EZBCCDEO2sZRRNd+mqiBJVqPFGgsncsxWVYJvgBKjBQWJ3aeHHH305+d+X0EYZzg
         ynluDjBT/PQVezE91CZ1PTI0K0ZINApE+QJUwV7cVBvbW799lM0ua9mNxmAYvNJqhDLl
         Lx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898471; x=1795503271;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRxl9/6qde53Vk7mriBy0p9OdUsOse+58tmRT8HCG6E=;
        b=XxnWw4Kmq300IXzyUC/vzOWkCsySJsjRVcXKyVKPpq3mHQlTUyzXMySgKOB3+3RfNN
         7r+CSQYLDlToFJEwomni/SpmDtcynJyxaCYmFJZ8oxd1SscFbZYvq2iOJSJyxtAElp9m
         wOOvkxPvYfZDu05vFOpnR5zQe7ac7hK7mc6Uo42xh3lOPvbnZqKRmzgVIeAJwWm5Zbuu
         TJi2ZPF0efBL7BTFcVgDm0Ischt/atwKxuSd1/uuIRpNkNZe9ajCPtHCwMuf2IanqyCC
         gzb047c1u1UEV/GT1jpR5nLR/bOffGXmKjRzPs+5YfQnAHA4hJvy5Op38XV1BJoF+7zK
         nlyg==
X-Forwarded-Encrypted: i=1; AL+hErHJTm/nrKbQNJnP5ksY1Sjd68BSpCpBugBNUGuRSNPN5F4MRsitQE4OLrm2nTzb9BJf5D0YpbpfAB8pzrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8egrxWne556F1gxSOLM/MNP34MJk3KYYq6Wjo6zb5HHMc9TqUb
	m4QuCM6hbvWf2G3yTVbJqWppv58egzfQWCG2JVb/lQ9dWXkkLBPuC3Pk
X-Gm-Gg: AZFdTZcXWZsoP9YtrbV5Sl3Er32ZI7FGG/9FnXRCqSmuOjMX3NN4nUEae4oaNfb3sZC
	RhRBiN0kLHvwCTqluAVbOtOoShs++Dvhgwwe9N7ANoxUZkdXe9zPozNzpKHMGsMtoEf4jXa2fMs
	nk83+co7WN/4L6KG41b9dIQjSq/eMvNcV0wBqeBI5KqONp3jqXoDLVYl+Tr/yfw5MqKZlC6ZX2A
	07hHh4D3KI+Bb0tSP1P6MMLWsZtyhWjLNzz54qfQPqkKJ3o+4znjrkDH5Y3nB4LFvqQIHzJApua
	CpoEb/ZYOTKUzvLfzQg+HiVb/ZvOcy/4nprbvtD+WPVDB7q0Ts4pdv6hZMstIqNehtcQwiPBJfi
	HDvwkTqGjH+RWrQvvJkJduNcpAktQdkuzQBX5FapIq1BGSvoFd5q9s+sZaGT50vXfBRxS6Bk2o9
	bdhaPOmyk4FEBiV1OoB2+XMopKafahD4mk8YtL0Ekh4PneEPGy3qeVWFa58xe7zj30y5yufKdus
	FDlPSa0seQncC0cWXvshtFy4S+BfLqVNkApRKCLI3O9Jb2k9p61fMPSTW8JxXGR2O76UWVfzcfa
	BHAXhpUAaUzqzAWdH3POBZ9wmRhsgjx20KXp5Jc795TuhxYEnl+ViNI/FvJqhNzcDUhMlebmpOT
	Tk13ddG/L1h0jHADVIU+th+elk9U6FlUSO0g=
X-Received: by 2002:a5d:5e88:0:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-49c6d63fbe1mr26407389f8f.3.1794898470695;
        Mon, 16 Nov 2026 22:54:30 -0800 (PST)
Received: from localhost ([46.36.23.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm27710685f8f.52.2026.11.16.22.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:54:30 -0800 (PST)
Date: Tue, 17 Nov 2026 11:54:28 +0500
From: Mark Korenberg <socketpair@gmail.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] btrfs: zoned: reset leaked zones on read-write mount
In-Reply-To: <20261102-b4-btrfs-zoned-reset-leaked-zones-v3-1-7979bda654ff@gmail.com>
References: <20261102-b4-btrfs-zoned-reset-leaked-zones-v3-1-7979bda654ff@gmail.com>
Message-ID: <81f8a131f512f715c71947046ddc87a9@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 02 Nov 2026 20:35:04 +0500, Mark Korenberg wrote:
> If a transaction commit is aborted after the zones of a new block group
> were written but before the superblock was, the chunk item and the dev
> extent are never persisted and the zones leak.

Hi Johannes,

a gentle ping on this one. It is the patch you handed over to me in the
RFC thread, could you have a look when you have time?

It still applies cleanly on top of today's for-next (146946479b45) and
builds there, no changes since v3. I can resend it rebased if that is
more convenient.

Thanks,
Mark
