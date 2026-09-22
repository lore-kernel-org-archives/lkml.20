Received: from mail-dl2-f32.google.com (mail-dl2-f32.google.com [74.125.229.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C334A207A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106524; cv=none; b=UOo6gSNQiK+sdoFoTLDBFux17avj5+XUVepkQOHhOlzJuKol3u6IiIfKusdwzVCyxIYuSaHPBVBwaotC2DfKbaoRzE1cCJyXZIr/z8p1SLXM+NZ+yKVTBu827PEVBIM6DMS3BD3pUnQMqxWDjGWMk844rJGwmqKI2uJyCJHoOq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106524; c=relaxed/simple;
	bh=jNQfUoCT0rQsQDqvqd6O5D53mFke1F/vMOIqT2BbWDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZBXVtC2EKwavivoqIsfD0obrh/V8/2GXHOMnhriP/lY3hJwA1OMpTqSI6nHeY3C5n5xdbEV0lrcRcn3OKZgEsRc+FPR4AaBZ7G+vKSLqgXnjdaYbayLSeTze99FMu2qZIL3kOm0eFyZauKN3V07r+2oFfu3iRhhjgi2BCW/v/98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=gU8c5Hm7; arc=none smtp.client-ip=74.125.229.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="gU8c5Hm7"
Received: by mail-dl2-f32.google.com with SMTP id a92af1059eb24-1437b77c274so114730c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790106522; x=1790711322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWpsGs8VSxj7CDadxY03DnkBRPzm3FWyOuoPzRkUTdI=;
        b=gU8c5Hm70qVVuw24l07nxO3NySfo7ayObbRajNacpN4vIqkrQyUEiBW72XVJaNrHYV
         vQXwGb42GnE2asbbwBf6YD8PB4l1z8WN3+fjt2mL5vIZVBJo0ZHghTh5ckAMM1MHfA3W
         HzzBl5BnlfDPKT1K5YUFXdofQtCUkDDOuKuYqs8V9XOZ8Ep4E+w+3Zq3v1E1h8h0hlil
         ojGePFK4+P46QfDRBYKs4+ufujkWeaoyf7mUCMplo5u69GWI9ddv+5Bn100Eu9b0PC5c
         m09kNZlohBxIbiIFAS0hFP1Q4sZxGSR29WxLh4v13ATFxKw1NbXcRwzP81SLLCIOGdLx
         F0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790106522; x=1790711322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWpsGs8VSxj7CDadxY03DnkBRPzm3FWyOuoPzRkUTdI=;
        b=L4o5tIbg6eRA/N5zdsD0XfsvX82Ez3iFDvuWlcAPRcC4ZY36Rc2XiNhHE6PqvlpbEE
         5HoajBzL4JD2RnibI/bEf3UXmxcMy3kCXHa3BSn+j3+bM+8ld/4vbj6QblEiyACieD1s
         sf3POroChUBxNVuNoERp/bO7FaAl69AHo3RZP3GX1U1dVjyOoqmcvTQpUN2wXLrd+awd
         cNPHIqIiDt8Et07gNWDWnxQ6EW7mc8zS+r2enlVOWnOfJWMM8nA6AsmI4r9wczT+NQVn
         eExbGJHySMe4bpE03X3v1CkVNGLQ2Kbyjt3dxBZxTyOEdBICYnCWYALt/oLSfCjEdGlp
         3XzA==
X-Forwarded-Encrypted: i=1; AKwUvBzsPcQP+UfI0FtVf4r1nYV4JOQUILBWNEFlN8yaav2GMNj9niXTnD+Jz8WHdHE1Syvu9lkCRluA1U86Gd4=@vger.kernel.org
X-Gm-Message-State: AFuF++nP9pQG+h91l9RBJIwj2PKQkAvcH5VaFklDuNxKa2oua07gx+Rt
	9hGIWDgUjxhufY6z1GMxEsY7v4DFPYr8JP6fVkarTOkSncfcSszJSNn+1tz5GXPmIt4=
X-Gm-Gg: AYBFou2YhCjX/PV/I5lszs7LKyryiX3h6/dU5aB1Y/uXFUqJ3iIOXMidoWxW5mybnLd
	z6nO82blfzZy0kBzUTPkv3O7l35ihrqomTnSNURfemtQQZfWX5CcB8fHN6gDB39wTgw7SfqtyqI
	Xj3otrLtZaq2zRs8lFR4NZ+cNxmq5c0umyYEziuglIvQLG42gmTGphS8X8mlPdnJW9UyuSBYiP9
	jkJDUzWgU3QaYAIwIhS/KEZxNwRLcXFU+r/eDAWZQf4RDc0LXMHwy2Qd8Vt2fMrd8gqrSyVfVXO
	bw6lLil+bX8UXeVaHnF3m1tzH79f7H10OqDFLgMvMMZj+vBWHWTEEf6yt5VqmT/Yihq2vb290wf
	nDB5LqiUCfagjkcs+Ur4mdhfn160w+vxSSussld8iOI6XXw+PFHLjS6axexLGFQ4pPekJy7AolN
	CGI6QD1ky4mNMxz4qp+QN5lEr551xPtIkYkjtsvJBxz2X2jufNV4yOfNZKshtB3yLz9BeP/HFE8
	mLfZc3DWEhWorMV0wnvKt9TXvSrfG/rqXaj6+3b8wx/CiN8uAJlvYuAMGNp8XD9YaY3HEs=
X-Received: by 2002:a05:7023:a5b:20b0:143:2973:3cfe with SMTP id a92af1059eb24-144f91cb630mr410014c88.31.1790106522287;
        Tue, 22 Sep 2026 12:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:c016:77a6:d382:7611])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm708550c88.13.2026.09.22.12.48.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 12:48:41 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pauli Virtanen <pav@iki.fi>
Subject: [PATCH 6.1.y 0/2] Bluetooth: backport CVE-2023-53762 to 6.1.y
Date: Tue, 22 Sep 2026 15:48:32 -0400
Message-ID: <20260922194838.26223-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and Bluetooth maintainers,

I am backporting CVEss still missing from 6.1.y.
This pair handles CVE-2023-53762 in disconnect-all cleanup. The
second patch is the immediate upstream liveness follow-up to the UAF fix,
so I kept the two together.

Both changes are already inherited by v6.6 and every later mainline
release.

Could you please queue the pair for 6.1.y?

Thanks,
Artem Dinaburg

AI assistance: An LLM helped find the missing CVE fix, adapt
it, and prepare the draft; I reviewed the code and build output.

Luiz Augusto von Dentz (1):
  Bluetooth: hci_sync: Fix UAF in hci_disconnect_all_sync

Pauli Virtanen (1):
  Bluetooth: hci_sync: always check if connection is alive before
    deleting

 net/bluetooth/hci_sync.c | 58 +++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 21 deletions(-)

-- 
2.39.5

