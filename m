Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619453;
	b=Py2EonHbVjRzR60jWspOHtj+usXPHw4OG20n/saBIhp+ly7QFqD/yb7WgRMJQ2AV/O7k
	 Gzk4x24oziaXL3VdN0yuL5YCAuR6gfNfDrhMFBcGtIwWsE2MC2jrmkHDC2marCb5pBtIj
	 j9kAnZKoR70jsZM27hI+wyJvT4fE3pk84FGezMnJAssC65OJS+3fFiU3qoZuW4R5W4KXN
	 dNr0AQeRP9Z1UdyLuptBJvQqY7ZNCjSH21QP1sWnrD49Dbw7ecX0/KMg6zr9hZSrNSTBg
	 B4EKqYM2ALCC7SJ5yLeXx/psPidX86HNJO3xESPjOaItiBAEdXIuG772zH76T9PKMaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iNVbIqY0np3EFl5r02H57aH+C95nGImopBoQIdWCOEE=;
	b=HU4WJJV1ZHnynAwE9rAA7WeAJMMHKwZe7NbL/6eNTW8wnC+UacDEvCF98loFryqDs/4L
	 X/Xj0+eRudtkaZ2V0e6nn3KcvbZmta+6J88YPSY8w+HVA6hnjcgub9iUaiODVwKvR9jAo
	 izZRp9P8Enu9YleYzSl/XXCI+PpzL4yQIz5I5HA9E9r1lcFlk5hlb4NkptUHKon4dSfPn
	 6onGm0WKrQOhMQ/+abYAdxY1eW18wPQAipJ8RmQGNGHg4ZgSdRjhV1v27HNo3qUv9CJ2+
	 eaFNaXAUG9WWqGwEWQ/G+bl/7Fe8maj3AZjZ97zMgHZ8x+AHOBlSp++bax0S477VlXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=P8sMRjQS;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF39E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=P8sMRjQS
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df0b02fe91so206682eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792619450; x=1793224250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNVbIqY0np3EFl5r02H57aH+C95nGImopBoQIdWCOEE=;
        b=P8sMRjQSlKY+E/heqfjcKfCDVd1BrkkUZWZs/wnhB9Chrkz6f+EKDA18pe+oioL2wF
         41dczgsQ9C/VtMYutUSdAyN+y0q5JLXhhescZfSA4DqyOgwYaaBxfsDhx6iaErMyFDma
         pxyMG6SihyqW4bBOBx2i7mTE8zZTjz6BOcFdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619450; x=1793224250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNVbIqY0np3EFl5r02H57aH+C95nGImopBoQIdWCOEE=;
        b=wKdzRC5gMqD2YyqV4hyHb3vuZ05H5kO88MqwKzW+Sd+XanQTPqBQgHUoSyu/4UIL5q
         0S6r/IYDeVaL0tXxVpeLtXv7mYPDYCzEzaR1q5ZtiUbEEXmbYDqKsNJnCFGC4r59E74D
         Dj0zWCjGm07W27dqpDlsYVYgjwahFBWYjvYj8lBJn3fRgvhU00kKONoLDvmfw9rhgOoh
         twPLHoxDN/TjXXgQLJkKTyoRpOe4AWcAfEf44hCEEEAWiML/6N57KMq7u8RWN7MsjPlv
         cSww2b/RRNZD+7bU1AmWdrE+fRA2OdQ+1LWG5sg4w1k1RI1ROIx6t5TTbPk59hkMr3Ou
         v3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBx58yE9Eypp8Iwxb9iQxJv2TzD7igD1G+TriEg1CoYU6ol+2YtMVYuOv0VPJYd0EWmXSYpCUVZ46BPvYHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh0cQNckzeLahd80UDneJsMRVZIlwtGcs4wLCdjf9frGl6J1ny
	61mFUi0MoSt9tSYuQIFFQ7Jry1v0d0S3R4dbKhy9QOzB/YQbFMVn/1FkWg18Ccmd/Xk=
X-Gm-Gg: AYBFou1i6s+n9RNo4IG3PDBMZLWOybmqGhTt9vJ1pYXxCCPDemjXXkckdaiAzaHbuZ7
	OxI0JmkconLqXa92FLm0cZzdV7NxQSo8GkICYv+zPUnAYwDifhnFhSzCKBXfGpWHKuthGTLKRdN
	un599+T6ctFt+6dBy7s9RwMQP9DCUsl0x72aNob5rzNaEXutjQ3Bqo557y4yH8e411zyx5ENfj9
	IG86U/9hPIIFzhc7IRE4UGRq+OIbr6VNnMd9LTTUzXbOr+C3mRrKfWgpg2hrMOzY+he2SRV5Ijr
	ZUGDAn/2F5Lzf6DNmsrziSc1z3Vut6jWjW9GRMpI57t3P/OWeakQbQkXBXKe/WhPn2TumIXOqki
	ahdeNgx1eX7CsBdoSEomR7/YpqSf5ZUZvpPToNJkijRC4wueyOETlTjSVkGjWnoTCMGt7O6sSBB
	9qo8QUBTzrornv29FswqFJk2PcaA/4sEwKmrfrv5gIbx6NUSbkRywalLsfFKhYLCG4Ol3VlK9EV
	0J7Qfoi9VW9wIgi0DpwMU8zbZUeYlSskc3R8Ic8vtkvq4bRaspHzH3+2wY5wjB4yokFsA==
X-Received: by 2002:a05:6820:1f05:b0:6cd:3fdc:2664 with SMTP id 006d021491bc7-70a7f50452bmr388171eaf.37.1792619450586;
        Wed, 21 Oct 2026 14:50:50 -0700 (PDT)
Received: from shuah-tx13.internal ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d2d29sm3413637a34.15.2026.10.21.14.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:50:49 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
To: hirofumi@mail.parknet.co.jp,
	shuah@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/filesystems: Fix run_fat_tests hang
Date: Wed, 21 Oct 2026 15:50:15 -0600
Message-ID: <20261021215045.26522-1-skhan@linuxfoundation.org>
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

run_fat_tests script hangs waiting at sudo prompt preventing the
kselftest default test to complete when a non-privileged user
runs the test. This is incorrect test behavior. Fix it to test
for root and skip the test.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 .../selftests/filesystems/fat/run_fat_tests.sh     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/filesystems/fat/run_fat_tests.sh b/tools/testing/selftests/filesystems/fat/run_fat_tests.sh
index d61264d4795d..0712c8d23fd7 100755
--- a/tools/testing/selftests/filesystems/fat/run_fat_tests.sh
+++ b/tools/testing/selftests/filesystems/fat/run_fat_tests.sh
@@ -15,6 +15,8 @@ BASE_DIR="$(dirname $0)"
 TMP_DIR="$(mktemp -d /tmp/fat_tests_tmp.XXXXXX)"
 IMG_PATH="${TMP_DIR}/fat.img"
 MNT_PATH="${TMP_DIR}/mnt"
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
 
 cleanup()
 {
@@ -23,6 +25,17 @@ cleanup()
 }
 trap cleanup SIGINT SIGTERM EXIT
 
+check_prereqs()
+{
+        local msg="skip all tests:"
+        local uid=$(id -u)
+
+        if [ $uid -ne 0 ]; then
+                echo $msg must be run as root >&2
+                exit $ksft_skip
+        fi
+}
+
 create_loopback()
 {
     touch "${IMG_PATH}"
@@ -73,6 +86,7 @@ unmount_image()
     sudo umount "${MNT_PATH}" &> /dev/null
 }
 
+check_prereqs
 create_loopback
 mount_image
 rename_exchange_test
-- 
2.48.1

